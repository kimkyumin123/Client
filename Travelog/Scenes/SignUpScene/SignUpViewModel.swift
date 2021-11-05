//  Travelog
//
//  Created by JK on 2021/08/14.
//

import Foundation
import ReactorKit
import RxFlow
import RxRelay

// MARK: - SignUpViewModel

final class SignUpViewModel: Reactor, Stepper {
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
    case updatePasswordValid(UserService.ValidType)
    case updateNicknameValid(UserService.ValidType)
    case updateEmailValid(UserService.ValidType)

    case signUpSuccess(Bool)
    case updateLoading(Bool)

    case setError(UserServiceError)
  }

  struct State {
    var isValidPassword: UserService.ValidType? = nil
    var isValidNickname: UserService.ValidType? = nil
    var isValidEmail: UserService.ValidType? = nil

    var isLoading: Bool = false
    var isSignUpSucceed: Bool = false

    var error: UserServiceError?
  }

  var initialState = State()
  var steps = PublishRelay<Step>()

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
          .catch { .just(Mutation.setError(try $0.cast(to: UserServiceError.self))) },
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

  private func passwordValidCheck(pw: String, pwConfirm: String) -> Observable<UserService.ValidType> {
    UserService.checkValidate(pw: pw, pwConfirm: pwConfirm)
  }

  private func emailValidCheck(_ mail: String) -> Observable<UserService.ValidType> {
    UserService.checkValidate(email: mail)
  }

  private func nickNameValidCheck(_ nick: String) -> Observable<UserService.ValidType> {
    guard nick.count >= 2 else {
      return Observable.just(.tooShort)
    }

    return UserService.checkValidate(nickname: nick)
  }

  private func signUp(fields: UserAccount.SignUpFields) -> Observable<Bool> {
    guard
      currentState.isValidEmail == .valid,
      currentState.isValidPassword == .valid,
      currentState.isValidNickname == .valid else
    {
      return Observable.error(UserServiceError.invalidForm)
    }

    return UserService.createUser(fields: fields)
      .andThen( .just(true) )
      .catchAndReturn(false)
  }
}
