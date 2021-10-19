//
//  UserService.swift
//  Travelog
//
//  Created by JK on 2021/08/11.
//

import Alamofire
import Foundation
import os.log
import RxApolloClient
import RxSwift

// MARK: - UserService

final class UserService {

  enum ValidType {
    case valid
    case invalid
    case alreadyExists
    case tooShort
    case needSpecialCharNumber
    case passwordNotSame
  }

  /// 사용자의 Access Token
  static var token: JWTToken? {
    get {
      guard let value = try? KeychainService.read(key: .accessToken) else {
        return nil
      }
      return JWTToken(value: value)
    }
    set {
      if let tokenString = newValue?.value {
        try? KeychainService.write(key: .accessToken, value: tokenString)
      }
    }
  }

  static func createUser(fields: UserAccount.SignUpFields) -> Observable<Bool> {
    os_log(.debug, log: .user, "createUser(fields:)")
    return .create { subscriber in
      Network.shared.apollo.perform(mutation: CreateUserMutation(
        bio: fields.bio,
        userName: fields.userName,
        gender: fields.gender,
        ageRange: fields.ageRange,
        email: fields.email,
        nickName: fields.nickName,
        avatar: fields.avatar,
        password: fields.password)) {
          guard let data = try? $0.get().data else {
            os_log(.info, log: .apollo, "Apollo Fetch Failed")
            subscriber.onError(UserServiceError.requestFailed)
            return
          }

          if data.createUser?.ok == true {
            os_log(.debug, log: .user, "User creation successful")
            subscriber.onNext(true)
          } else if data.createUser?.error == -100 {
            os_log(.debug, log: .user, "Email Exists")
            subscriber.onError(UserServiceError.emailExists)
          } else if data.createUser?.error == -101 {
            os_log(.debug, log: .user, "User Exists")
            subscriber.onError(UserServiceError.userExists)
          } else if data.createUser?.error == -102 {
            os_log(.debug, log: .user, "Nickname Exists")
            subscriber.onError(UserServiceError.nicknameExists)
          } else {
            os_log(.fault, log: .user, "Unknwon Error")
            subscriber.onError(UserServiceError.unknown)
          }
        }

      return Disposables.create()
    }
  }

  static func checkValidation(userName: String) -> Observable<ValidType> {
    os_log(.debug, log: .user, "checkValidate(userName:)")
    return .create { subscriber in
      Network.shared.apollo.fetch(query: UserNameValidationQuery(userName: userName)) {
        guard let _data = try? $0.get().data, let result = _data.userCheck else {
          os_log(.info, log: .apollo, "Apollo Fetch Failed")
          subscriber.onError(UserServiceError.requestFailed)
          return
        }

        if result.ok {
          subscriber.onNext(.valid)
        } else if result.error == -101 {
          subscriber.onNext(.alreadyExists)
        } else {
          subscriber.onNext(.invalid)
        }
        subscriber.onCompleted()
      }

      return Disposables.create()
    }
  }

  static func checkValidate(nickname: String) -> Observable<ValidType> {
    os_log(.debug, log: .user, "checkValidate(nickname:)")
    return .create { subscriber in
      Network.shared.apollo.fetch(query: NickNameValidationQuery(nickName: nickname)) {
        guard let _data = try? $0.get().data, let result = _data.userCheck else {
          os_log(.info, log: .apollo, "Apollo Fetch Failed")
          subscriber.onError(UserServiceError.requestFailed)
          return
        }

        if result.ok {
          subscriber.onNext(.valid)
        } else if result.error == -102 {
          os_log(.debug, log: .user, "Nickname already exists")
          subscriber.onNext(.alreadyExists)
        } else {
          subscriber.onNext(.invalid)
        }
        subscriber.onCompleted()
      }

      return Disposables.create()
    }
  }

  static func checkValidate(email: String) -> Observable<ValidType> {
    os_log(.debug, log: .user, "checkValidate(email:)")
    return .create { subscriber in
      guard
        let mailRegex = try? NSRegularExpression(
          pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .caseInsensitive) else
      {
        assertionFailure("Regex Failed")
        subscriber.onNext(.invalid)
        return Disposables.create()
      }

      let result = mailRegex.firstMatch(in: email, options: [], range: NSRange(email.startIndex..., in: email))
      guard result != nil else {
        os_log(.debug, log: .user, "Invalid email")
        subscriber.onNext(.invalid)
        return Disposables.create()
      }

      // 중복확인
      Network.shared.apollo.fetch(query: EmailValidationQuery(email: email)) {
        guard let _data = try? $0.get().data, let result = _data.userCheck else {
          os_log(.info, log: .apollo, "Apollo Fetch Failed")
          subscriber.onError(UserServiceError.requestFailed)
          return
        }

        if result.ok {
          subscriber.onNext(.valid)
        } else if result.error == -100 {
          os_log(.debug, log: .user, "Email already exists")
          subscriber.onNext(.alreadyExists)
        } else {
          subscriber.onNext(.invalid)
        }
        subscriber.onCompleted()
      }

      return Disposables.create()
    }
  }

  static func checkValidate(pw: String, pwConfirm: String) -> Observable<ValidType> {
    os_log(.debug, log: .user, "checkValidate(pw:pwConfirm)")
    return .create { subscriber in

      // 패스워드와 패스워드 확인은 동일
      guard pw == pwConfirm else {
        subscriber.onNext(.passwordNotSame)
        return Disposables.create()
      }

      // 패스워드는 최소 8자 이상
      guard pw.count >= 8 else {
        subscriber.onNext(.tooShort)
        return Disposables.create()
      }

      // 패스워드는 영문 / 숫자 / 특수문자
      let regexRule = "(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$&*]).{8,20}"
      guard let regex = try? NSRegularExpression(pattern: regexRule, options: .useUnicodeWordBoundaries) else {
        assertionFailure("Regex Failed")
        subscriber.onNext(.invalid)
        return Disposables.create()
      }

      let result = regex.firstMatch(in: pw, options: [], range: NSRange(pw.startIndex..., in: pw))
      guard result != nil else {
        os_log(.debug, log: .user, "Password policy violation")
        subscriber.onNext(.needSpecialCharNumber)
        return Disposables.create()
      }
      subscriber.onNext(.valid)
      subscriber.onCompleted()

      return Disposables.create()
    }
  }

  static func updateUser(fields: UserAccount.UpdateFields) -> Observable<Bool> {
    os_log(.debug, log: .user, "Update User")

    return Network.shared.apollo.rx.perform(mutation: EditUserMutation(
      nickName: fields.nickName,
      bio: fields.bio,
      avatar: fields.avatar,
      password: fields.password,
      gender: fields.gender,
      ageRange: fields.ageRange))
      .asObservable()
      .map { ($0.editUser?.ok ?? false) == true }
      .catchAndReturn(false)
  }

  static func deleteUser() -> Observable<Bool> {
    os_log(.debug, log: .user, "Delete user")
    return Network.shared.apollo.rx.perform(mutation: DeleteUserMutation())
      .asObservable()
      .flatMap({ result -> Observable<Bool> in
        guard result.deleteUser?.ok == true else {
          return .just(false)
        }

        switch UserDefaults.loginPlatform {
        case .naver:
          return ThirdPartyLoginService
            .naverDisconnect()
            .map { _ in true }
            .asObservable()
            .catchAndReturn(false)

        case .kakao:
          return ThirdPartyLoginService
            .kakaoDisconnect()
            .andThen(Observable.just(true))
            .catchAndReturn(false)

        default:
          return .just(true)
        }
      })
      .catchAndReturn(false)
      // 로그인 상태 변경, 토큰 제거
      .do(onNext: { if $0 { deleteLoginInfo() } })
  }

  /// login 후 토큰 생성
  static func login(id: String, pw: String) -> Observable<(accessToken: JWTToken, refreshToken: JWTToken)> {
    os_log(.debug, log: .user, "login(id:pw:)")
    deleteLoginInfo()
    return .create { subscriber in
      Network.shared.apollo.perform(mutation: UserLoginMutation(userName: id, password: pw)) {
        guard let _data = try? $0.get().data, let data = _data.userLogin, data.ok == true else {
          os_log(.info, log: .apollo, "Apollo Fetch Failed")
          subscriber.onError(UserServiceError.requestFailed)
          return
        }

        // token string 획득
        guard
          let accessTokenString = data.token?.accessToken,
          let refreshTokenString = data.token?.refreshToken else
        {
          subscriber.onError(UserServiceError.signUpFailed)
          return
        }

        // token object 생성
        guard
          let accessToken = JWTToken(value: accessTokenString),
          let refreshToken = JWTToken(value: refreshTokenString) else
        {
          subscriber.onError(UserServiceError.invalidToken)
          return
        }

        subscriber.onNext((accessToken, refreshToken))
      }

      return Disposables.create()
    }
    // 키체인에 토큰 저장, 로그인 저장
    .do(onNext: { access, refresh in
      updateLoginInfo(id: id, accessToken: access.value, refreshToken: refresh.value)
    })
  }

  // TODO: 요구사항에 따라 쿼리 세분화 작성 필요.
  static func seeProfile(userName: String = UserDefaults.userID) -> Observable<SeeProfileQuery.Data.SeeProfile> {
    os_log(.debug, log: .user, "seeProfile(userName:)")
    return .create { subscriber in
      Network.shared.apollo.fetch(query: SeeProfileQuery(userName: userName)) {
        guard let _data = try? $0.get().data else {
          os_log(.info, log: .apollo, "Apollo Fetch Failed")
          subscriber.onError(UserServiceError.requestFailed)
          return
        }

        guard let data = _data.seeProfile else {
          os_log(.debug, log: .user, "Can not find user")
          subscriber.onError(UserServiceError.canNotFindUser)
          return
        }

        subscriber.onNext(data)
      }
      return Disposables.create()
    }
  }

  static func renewToken(completion: @escaping (Result<(String, String), UserServiceError>) -> Void) {
    os_log(.debug, log: .user, "renewToken(completion:)")
    guard
      let refreshToken = try? KeychainService.read(key: .refreshToken),
      let url = URL(string: "\(Constraints.serverAddr):\(Constraints.port)/tokenupdate") else { return }
    AF.request(
      url,
      method: .post,
      parameters: ["token": refreshToken],
      headers: [.contentType("application/x-www-form-urlencoded")]).responseJSON { json in
      guard
        let json = json.value as? [String: String],
        let accessToken = json["accessToken"], let refreshToken = json["refreshToken"] else
      {
        completion(.failure(.invalidToken))
        return
      }
      completion(.success((accessToken, refreshToken)))

      // save to keychain
      try? KeychainService.write(key: .accessToken, value: accessToken)
      try? KeychainService.write(key: .refreshToken, value: refreshToken)
    }
    .resume()
  }

  static func logout() -> Completable {
    defer { deleteLoginInfo() }

    return Network.shared.apollo.rx.perform(mutation: LogoutMutation())
      .asObservable()
      .flatMap { data -> Observable<Never> in
        guard data.userLogout?.ok == true else {
          return Observable.error(UserServiceError.denied)
        }

        switch UserDefaults.loginPlatform {
        case .naver:
          ThirdPartyLoginService.naverLogout()
          return .never()
        case .kakao:
          return ThirdPartyLoginService.kakaoLogout().asObservable()
        default:
          return .never()
        }
      }
      .asCompletable()
  }

  /// 로그인 정보 기록
  static func updateLoginInfo(id: String, platform: UserAccount.Platform = .service, accessToken: String, refreshToken: String) {
    os_log(.debug, log: .user, "Update Login Info")
    UserDefaults.userID = id
    UserDefaults.loginPlatform = platform
    try? KeychainService.write(key: .accessToken, value: accessToken)
    try? KeychainService.write(key: .refreshToken, value: refreshToken)
  }

  /// 로그인 정보 제거
  static func deleteLoginInfo() {
    os_log(.debug, log: .user, "Delete Login Info")
    UserDefaults.userID = ""
    UserDefaults.loginPlatform = .notLoggedIn
    try? KeychainService.delete(key: .accessToken)
    try? KeychainService.delete(key: .refreshToken)
  }
}

// MARK: - UserServiceError

enum UserServiceError: Error {
  case invalidForm
  case unknown
  case noUserLoggedIn
  case requestFailed
  case denied
  case invalidToken

  case emailExists
  case userExists
  case nicknameExists
  case signUpFailed
  case canNotFindUser
  case passwordNotCorrect
  case expiredRefreshToken
}
