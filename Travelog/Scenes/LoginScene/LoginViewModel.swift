//
//  LoginViewModel.swift
//  Travelog
//
//  Created by JK on 2021/08/18.
//

import Foundation
import KakaoSDKAuth
import os.log
import ReactorKit
import RxFlow
import RxRelay

// MARK: - LoginViewModel

final class LoginViewModel: Stepper, Reactor {
  enum Action {
    case kakaoLogin
    case naverLogin
    case serviceLogin(id: String, pw: String)
    case appleLogin
  }

  enum Mutation {
    case ignore
    case setLoading(Bool)
    case setError(UserServiceError)
  }

  struct State {
    var isLoading: Bool = false
    var error: (rev: Int, error: UserServiceError?) = (0, nil)
  }

  var steps = PublishRelay<Step>()

  var initialState = State()

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .ignore:
      break
    case .setLoading(let boolean):
      newState.isLoading = boolean
    case .setError(let err):
      os_log("setError")
      newState.error = (newState.error.rev + 1, err)
    }

    return newState
  }

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .kakaoLogin:
      return Observable.concat(
        .just(.setLoading(true)),
        kakaoLogin()
          .map { _ in Mutation.ignore }
          .catch { .just(Mutation.setError(try $0.cast(to: UserServiceError.self))) },
        .just(.setLoading(false)))

    case .naverLogin:
      return Observable.concat([
        .just(.setLoading(true)),
        naverLogin()
          .map { _ in Mutation.ignore }
          .catch { .just(Mutation.setError(try $0.cast(to: UserServiceError.self))) },
        .just(.setLoading(false)),
      ])

    default:
      return .just(.ignore)
    }
  }
}

// MARK: - Logic

extension LoginViewModel {

  // MARK: Internal

  static func kakaoGetMailAndOAuthLogin() -> Observable<Void> {
    ThirdPartyLoginService.getKakaoEmail()
      .flatMap { _ -> Observable<Void> in
        if let token = TokenManager.manager.getToken()?.accessToken {
          return ThirdPartyLoginService.oAuthLogin(type: .kakao, token: token)
            .map { _ in () }
        } else {
          return .error(UserServiceError.denied)
        }
      }
      .map { _ in () }
  }

  // MARK: Private

  /// 카카오 로그인 후 OAuth Login 시도.
  private func kakaoLogin() -> Observable<AppSteps> {
    ThirdPartyLoginService.kakaoLogin()
      // 전달 받은 토큰으로 로그인 시도
      .flatMap {
        // 로그인 성공시, main screen 이동
        ThirdPartyLoginService.oAuthLogin(type: .kakao, token: $0)
          .map { _ in .mapScreenIsRequired }
      }
      .catch {
        let err = try $0.cast(to: UserServiceError.self)
        // signup 화면으로 전환
        if err == .canNotFindUser {
          return .just(.oAuthSignUp)
        } else {
          return .error(err)
        }
      }
      .do(onNext: { [weak self] in
        self?.steps.accept($0)
      })
  }

  private func naverLogin() -> Observable<AppSteps> {
    ThirdPartyLoginService.naverLogin()
      .flatMap {
        ThirdPartyLoginService.oAuthLogin(type: .naver, token: $0)
          .map { _ in .mapScreenIsRequired }
      }
      .catch {
        let err = try $0.cast(to: UserServiceError.self)
        // signup 화면으로 전환
        if err == .canNotFindUser {
          return .just(.oAuthSignUp)
        } else {
          return .error(err)
        }
      }
      .do(onNext: { [weak self] in
        self?.steps.accept($0)
      })
  }

}
