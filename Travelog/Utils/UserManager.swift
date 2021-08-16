//
//  UserManager.swift
//  Travelog
//
//  Created by JK on 2021/08/11.
//

import Foundation
import RxSwift

// MARK: - UserManager

final class UserManager {
  enum ValidType {
    case valid
    case invalid
    case alreadyExists
    case tooShort
    case needSpecialCharNumber
    case passwordNotSame
  }

  static func createUser(fields: UserAccount.SignUpFields) -> Observable<Bool> {
    .create { subscriber in
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
            subscriber.onError(UserManagerError.signUpFailed)
            return
          }

          if data.createUser?.ok == true {
            subscriber.onNext(true)
          } else if data.createUser?.error == -100 {
            subscriber.onError(UserManagerError.emailExists)
          } else if data.createUser?.error == -101 {
            subscriber.onError(UserManagerError.userExists)
          } else if data.createUser?.error == -102 {
            subscriber.onError(UserManagerError.nicknameExists)
          } else {
            subscriber.onError(UserManagerError.unknown)
          }
      }

      return Disposables.create()
    }
  }

  static func createOAuthUser() { }

  static func checkValidate(nickname: String) -> Observable<ValidType> {
    .create { subscriber in
      Network.shared.apollo.fetch(query: UserCheckQuery(email: nil, nickName: nickname)) {
        guard let _data = try? $0.get().data, let result = _data.userCheck else {
          subscriber.onNext(.invalid)
          return
        }

        if result.ok {
          subscriber.onNext(.valid)
        } else if result.error == -102 {
          subscriber.onNext(.alreadyExists)
        } else {
          subscriber.onNext(.invalid)
        }
      }

      return Disposables.create()
    }
  }

  static func checkValidate(email: String) -> Observable<ValidType> {
    .create { subscriber in

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
        subscriber.onNext(.invalid)
        return Disposables.create()
      }

      // TODO: 이메일 중복 확인.
      Network.shared.apollo.fetch(query: UserCheckQuery(email: email, nickName: nil)) {
        guard let _data = try? $0.get().data, let result = _data.userCheck else {
          subscriber.onNext(.invalid)
          return
        }

        if result.ok {
          subscriber.onNext(.valid)
        } else if result.error == -100 {
          subscriber.onNext(.alreadyExists)
        } else {
          subscriber.onNext(.invalid)
        }
      }

      return Disposables.create()
    }
  }

  static func checkValidate(pw: String, pwConfirm: String) -> Observable<ValidType> {
    .create { subscriber in

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
        subscriber.onNext(.needSpecialCharNumber)
        return Disposables.create()
      }
      subscriber.onNext(.valid)

      return Disposables.create()
    }
  }

  static func updateUser() { }

  static func deleteUser() { }

  static func login() { }

  static func oAuthLogin() { }

  static func logout() {}
}

// MARK: - UserManagerError

enum UserManagerError: Error {
  case invalidForm
  case unknown

  case emailExists
  case userExists
  case nicknameExists
  case signUpFailed
  case canNotFindUser
  case passwordNotCorrect
  case expiredRefreshToken
}
