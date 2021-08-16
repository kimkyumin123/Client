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

  enum Action {
    case validCheck(ValidCheck)
    case submit(UserAccount.SignUpFields)
  }

  enum Mutation {
    case updatePasswordValid(UserManager.ValidType)
    case updateNicknameValid(UserManager.ValidType)
    case updateEmailValid(UserManager.ValidType)

    case signUpSuccess(Bool)
    case updateLoading(Bool)

    case setError(UserManagerError)
  }

  struct State {
    var isValidPassword: UserManager.ValidType? = nil
    var isValidNickname: UserManager.ValidType? = nil
    var isValidEmail: UserManager.ValidType? = nil

    var isLoading: Bool = false
    var isSignUpSucceed: Bool = false

    var error: UserManagerError?
  }

  var initialState = State()

  var scheduler: Scheduler = SerialDispatchQueueScheduler(qos: .default)

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .signUpSuccess(let bool):
      newState.isSignUpSucceed = bool
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
          .catch { .just(Mutation.setError(try $0.cast(to: UserManagerError.self))) },
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

  private func passwordValidCheck(pw: String, pwConfirm: String) -> Observable<UserManager.ValidType> {
    UserManager.checkValidate(pw: pw, pwConfirm: pwConfirm)
  }

  private func emailValidCheck(_ mail: String) -> Observable<UserManager.ValidType> {
    UserManager.checkValidate(email: mail)
  }

  private func nickNameValidCheck(_ nick: String) -> Observable<UserManager.ValidType> {
    guard nick.count >= 2 else {
      return Observable.just(.tooShort)
    }

    return UserManager.checkValidate(nickname: nick)
  }

  private func signUp(fields: UserAccount.SignUpFields) -> Observable<Bool> {
    guard
      currentState.isValidEmail == .valid,
      currentState.isValidPassword == .valid,
      currentState.isValidNickname == .valid else
    {
      return Observable.error(UserManagerError.invalidForm)
    }

    return UserManager.createUser(fields: fields)
  }
}
