//  Travelog
//
//  Created by JK on 2021/08/14.
//

import Foundation
import ReactorKit

// MARK: - SignUpViewModel

final class SignUpViewModel: Reactor {
  enum ValidCheck {
    case nickname(String)
    case password(String, String)
    case email(String)
  }

  enum ValidType {
    case valid
    case invalid
    case alreadyExists
    case tooShort
    case needSpecialCharNumber
    case passwordNotSame
  }

  enum Action {
    case validCheck(ValidCheck)
    case submit(SignUpFields)
  }

  enum Mutation {
    case updatePasswordValid(ValidType)
    case updateNicknameValid(ValidType)
    case updateEmailValid(ValidType)

    case signUpSuccess(Bool)
    case updateLoading(Bool)

    case setError(Error)
  }

  struct State {
    var isValidPassword: ValidType? = nil
    var isValidNickname: ValidType? = nil
    var isValidEmail: ValidType? = nil

    var isLoading: Bool = false
    var isSignUpSucceed: Bool = false

    var error: Error?
  }

  struct SignUpFields {
    let userName: String
    let bio: String?
    let gender: String?
    let ageRange: String?
    let email: String
    let nickName: String
    let avatar: String?
    let password: String
  }

  var initialState = State()

  var scheduler: Scheduler = SerialDispatchQueueScheduler(qos: .default)

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .signUpSuccess(let validation):
      newState.isSignUpSucceed = validation
    case .updateEmailValid(let validation):
      newState.isValidEmail = validation
    case .updateNicknameValid(let validation):
      newState.isValidNickname = validation
    case .updatePasswordValid(let validation):
      newState.isValidPassword = validation
    case .updateLoading(let bool):
      newState.isLoading = bool
    case .setError(let err):
      newState.error = err
    }

    return newState
  }

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .validCheck(let field):
      return validCheck(field: field)
    case .submit(let fields):
      return Observable.concat(
        .just(.updateLoading(true)),
        signUp(fields: fields)
          .map { Mutation.signUpSuccess($0) }
          .catch { .just(Mutation.setError($0)) },
        .just(.updateLoading(false)
        ))
    }
  }
}

// MARK: - Logic

extension SignUpViewModel {
  private func validCheck(field: ValidCheck) -> Observable<Mutation> {
    switch field {
    case .password(let pw, let pwConfirm):
      return passwordValidCheck(pw: pw, pwConfirm: pwConfirm)
        .map { Mutation.updatePasswordValid($0) }

    case .email(let mail):
      return emailValidCheck(mail)
        .map { Mutation.updateEmailValid($0) }

    case .nickname(let nickname):
      return nickNameValidCheck(nickname)
        .map { Mutation.updateNicknameValid($0) }
    }
  }

  private func passwordValidCheck(pw: String, pwConfirm: String) -> Observable<ValidType> {
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

  private func emailValidCheck(_ mail: String) -> Observable<ValidType> {
    .create { subscriber in

      guard
        let mailRegex = try? NSRegularExpression(
          pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", options: .caseInsensitive) else
      {
        assertionFailure("Regex Failed")
        subscriber.onNext(.invalid)
        return Disposables.create()
      }

      let result = mailRegex.firstMatch(in: mail, options: [], range: NSRange(mail.startIndex..., in: mail))
      guard result != nil else {
        subscriber.onNext(.invalid)
        return Disposables.create()
      }

      // TODO: 이메일 중복 확인.
      Network.shared.apollo.fetch(query: UserCheckQuery(email: mail, nickName: nil)) {
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

  private func nickNameValidCheck(_ nick: String) -> Observable<ValidType> {
    guard nick.count >= 2 else {
      return Observable.just(.tooShort)
    }

    return .create { subscriber in
      Network.shared.apollo.fetch(query: UserCheckQuery(email: nil, nickName: nick)) {
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

  private func signUp(fields: SignUpFields) -> Observable<Bool> {
    guard
      currentState.isValidEmail == .valid,
      currentState.isValidPassword == .valid,
      currentState.isValidNickname == .valid else
    {
      return Observable.error(SignUpError.invalidForm)
    }

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
            subscriber.onError(SignUpError.signUpFailed)
            return
          }

          if data.createUser?.ok == true {
            subscriber.onNext(true)
          } else if data.createUser?.error == -100 {
            subscriber.onError(SignUpError.emailExists)
          } else if data.createUser?.error == -101 {
            subscriber.onError(SignUpError.userExists)
          } else if data.createUser?.error == -102 {
            subscriber.onError(SignUpError.nicknameExists)
          } else {
            subscriber.onError(SignUpError.unknown)
          }
      }

      return Disposables.create()
    }
  }
}

// MARK: - SignUpError

enum SignUpError: Error {
  case invalidForm
  case signUpFailed
  case emailExists
  case userExists
  case nicknameExists
  case unknown
}
