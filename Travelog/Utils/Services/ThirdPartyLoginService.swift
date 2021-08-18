//
//  ThirdPartyLoginService.swift
//  ThirdPartyLoginService
//
//  Created by JK on 2021/08/17.
//

import Apollo
import Foundation
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser
import os.log
import RxApolloClient
import RxKakaoSDKAuth
import RxKakaoSDKUser
import RxSwift

/// OAuth 사용자 로그인 과정
/// 1.  로그인 시도.
/// 2. 미가입 사용자일 시에 -303 에러
/// 3. 303 시에 CreateAuth 로 시도.

/// 서드파티 로그인 (네이버, 카카오, 애플) 지원
final class ThirdPartyLoginService {

  // MARK: Lifecycle

  private init() { }

  // MARK: Internal

  enum Platform: String {
    case kakao, naver, apple
  }

  typealias KakaoAccountReturn = (accessToken: String, email: String)

  static func oAuthSignUp(type: Platform, token: String, fields: UserAccount.SignUpFields) -> Observable<Bool> {

    let mutation = CreateAuthUserMutation(
      nickName: fields.nickName,
      avatar: fields.avatar,
      bio: fields.bio,
      platformType: type.rawValue,
      email: fields.email)

    return Network.shared.apollo.rx.perform(mutation: mutation)
      .asObservable()
      .map { $0.createAuthUser?.ok == true }
      .catchAndReturn(false)
  }

  /// 카카오 로그인
  /// 사용자가 거부시, `UserServiceError.denied` 전파
  static func kakaoLogin() -> Observable<KakaoAccountReturn> {
    kakaoGetToken()
      .flatMap {
        Observable.combineLatest( Observable.just($0.accessToken), getKakaoEmail()) {
          (accessToken: $0, email: $1)
        }
      }
      // 에러 확인.
      .catch {
        guard let err = $0 as? SdkError else { return .error(UserServiceError.unknown) }
        if
          err.isAuthFailed,
          err.getAuthError().reason == .AccessDenied
        {
          return .error(UserServiceError.denied)
        } else {
          return .error(UserServiceError.unknown)
        }
      }
  }

//  static func naverLogin() -> Observable {
//    NaverThirdPartyLoginConnectionDelegate
//  }

  /**
   OAuth 사용자 로그인 시도.

   존재하지 않는 회원 일 시, `UserServiceError.canNotFindUser` 호출
   */
  static func oAuthLogin(type: Platform, token: String) -> Observable<Void> {
    os_log(.debug, log: .user, "oAuthLogin(type:token:)")
    return .create { subscriber in
      Network.shared.apollo.perform(mutation: AuthUserLoginMutation(platform_type: type.rawValue, accesstoken: token)) {
        guard let _data = try? $0.get().data else {
          os_log(.info, log: .apollo, "Apollo Fetch Failed")
          subscriber.onError(UserServiceError.requestFailed)
          return
        }

        guard _data.authUserLogin?.ok == true else {
          // 미가입 유저
          if _data.authUserLogin?.error == -303 {
            subscriber.onError(UserServiceError.canNotFindUser)
          } else {
            subscriber.onError(UserServiceError.unknown)
          }
          return
        }

        subscriber.onNext(())
      }

      return Disposables.create()
    }
  }

  /// 사용자가 동의를 거절했을 때,  `err.getAuthError().reason == .AccessDenied` 발생.
  ///

  // 선택항목에서 메일을 제외할 시에 추가 요청을 위해 분리함.
  /// 메일 수집을 위해 설정
  static func getKakaoEmail() -> Observable<String> {
    UserApi.shared.rx.me()
      .compactMap { user -> String? in
        var scopes = [String]()

        if user.kakaoAccount?.emailNeedsAgreement == true { scopes.append("account_email") }
        if scopes.count > 0 {
          throw SdkError(scopes: scopes)
        } else {
          return user.kakaoAccount?.email
        }
      }
      .retry(when: Auth.shared.rx.incrementalAuthorizationRequired())
      .asObservable()
  }

  // MARK: Private

  // 카카오 로그인 및 토큰 획득.
  private static func kakaoGetToken() -> Observable<OAuthToken> {
    os_log(.debug, log: .user, "kakaoGetToken()")
    // 토큰이 이미 존재 시 반환.
    if
      let token = TokenManager.manager.getToken(),
      token.expiresIn > 0
    {
      os_log(.debug, log: .user, "Token exists, return stored token")
      return .just(token)
    }

    // kakaotalk 설치 여부 확인
    if UserApi.isKakaoTalkLoginAvailable() {
      os_log(.debug, log: .user, "Login with KakaoTalk")
      return UserApi.shared.rx.loginWithKakaoTalk()
    } else {
      os_log(.debug, log: .user, "Login with KakaoAccount")
      return UserApi.shared.rx.loginWithKakaoAccount()
    }
  }
}
