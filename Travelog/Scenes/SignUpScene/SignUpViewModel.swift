//  Travelog
//
//  Created by JK on 2021/08/14.
//

import Foundation
import Photos.PHAsset
import ReactorKit
import RxFlow
import RxRelay

// MARK: - SignUpViewModel

final class SignUpViewModel: Reactor, Stepper {

  enum Action {
    enum Fields {
      case userID(String)
      case nickname(String)
      case password(String, String)
      case email(String)
      case bio(String)
      case image(PHAsset)
      case gender(String)
      case ageRange(String)
    }

    case update(Fields)
    case submit
  }

  enum Mutation {

    case updateUsernameValid(UserService.ValidType)
    case updatePasswordValid(UserService.ValidType)
    case updateNicknameValid(UserService.ValidType)
    case updateEmailValid(UserService.ValidType)

    case updateFields(Fields)

    case signUpSuccess(Bool)
    case updateLoading(Bool)

    case setError(UserServiceError)

    // MARK: Internal

    enum Fields {
      case userID(String)
      case nickname(String)
      case password(String)
      case email(String)
      case bio(String)
      case image(Data)
      case gender(String)
      case ageRange(String)
    }
  }

  struct State {
    var isValidUsername: UserService.ValidType? = nil
    var isValidPassword: UserService.ValidType? = nil
    var isValidNickname: UserService.ValidType? = nil
    var isValidEmail: UserService.ValidType? = nil

    var fields = UserAccount.SignUpFields(userName: "", email: "", nickName: "", password: "")

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
    case .updateUsernameValid(let validation):
      newState.isValidUsername = validation
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
    case .updateFields(let field):
      switch field {
      case .ageRange(let ageRange):
        newState.fields.ageRange = ageRange
      case .bio(let bio):
        newState.fields.bio = bio
      case .userID(let id):
        newState.fields.userName = id
      case .nickname(let nickName):
        newState.fields.nickName = nickName
      case .password(let pw):
        newState.fields.password = pw
      case .image(let data):
        newState.fields.avatar = data
      case .email(let mail):
        newState.fields.email = mail
      case .gender(let gender):
        newState.fields.gender = gender
      }
    }
    return newState
  }

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .update(let field):
      return update(field: field)
    case .submit:
      return Observable.concat(
        .just(.updateLoading(true)),
        signUp(fields: currentState.fields)
          .map { Mutation.signUpSuccess($0) }
          .catch { .just(Mutation.setError(try $0.cast(to: UserServiceError.self))) },
        .just(.updateLoading(false)))
    }
  }
}

// MARK: - Logic

extension SignUpViewModel {
  private func update(field: Action.Fields) -> Observable<Mutation> {
    switch field {
    case .userID(let id):
      return .concat(
        userNameValidCheck(id)
          .map { Mutation.updateUsernameValid($0) },
        .just(.updateFields(Mutation.Fields.userID(id))))
    case .nickname(let nick):
      return .concat(
        nickNameValidCheck(nick)
          .map { Mutation.updateNicknameValid($0) },
        .just(.updateFields(Mutation.Fields.nickname(nick))))
    case .password(let pw1, let pw2):
      return .concat(
        passwordValidCheck(pw: pw1, pwConfirm: pw2)
          .map { Mutation.updatePasswordValid($0) },
        .just(.updateFields(Mutation.Fields.password(pw1))))
    case .email(let mail):
      return .just(.updateFields(Mutation.Fields.email(mail)))
    case .bio(let bio):
      return .just(.updateFields(Mutation.Fields.bio(bio)))
    case .gender(let gender):
      return .just(.updateFields(Mutation.Fields.gender(gender)))
    case .ageRange(let ageRange):
      return .just(.updateFields(Mutation.Fields.ageRange(ageRange)))
    case .image(let asset):
      return PhotoService.data(from: asset)
        .map { Mutation.updateFields(Mutation.Fields.image($0) ) }
    }
  }

  private func validCheck(field: Action.Fields) -> Observable<Mutation> {
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

    // TODO: - 아이디 valid check 필요
    default:
      assertionFailure("This code never executed.")
      return .just(.setError(UserServiceError.unknown))
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

  private func userNameValidCheck(_ id: String) -> Observable<UserService.ValidType> {
    guard id.count >= 3 else {
      return .just(.tooShort)
    }
    
    return UserService.checkValidation(userName: id)
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
