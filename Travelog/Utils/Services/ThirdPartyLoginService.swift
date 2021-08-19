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
import NaverThirdPartyLogin
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

  typealias KakaoAccountReturn = (accessToken: String, email: String)

  static func oAuthSignUp(type: UserAccount.Platform, token: String, fields: UserAccount.OAuthSignUpFields) -> Observable<Bool> {

    let mutation = CreateAuthUserMutation(
      nickName: fields.nickName,
      avatar: fields.avatar,
      bio: fields.bio,
      platformType: type.value,
      email: fields.email)

    return Network.shared.apollo.rx.perform(mutation: mutation)
      .asObservable()
      .map { $0.createAuthUser?.ok == true }
      .catchAndReturn(false)
  }

  /// 카카오 로그인
  static func kakaoLogin() -> Observable<String> {
    _kakaoLogin()
      .map(\.accessToken)
      // 이메일 획득 시도
      .flatMap { token -> Observable<String> in
        Observable.combineLatest(Observable.just(token), ThirdPartyLoginService.getKakaoEmail()) { token, _ in token }
      }
  }

  /// 사용자가 거부시, `UserServiceError.denied` 전파
  static func kakaoSignUp() -> Observable<String> {
    getKakaoEmail()

  }

  /**
   네이버 로그인을 시도합니다.
   성공 시 토큰 반환.
   */
  static func naverLogin() -> Observable<String> {
    NaverThirdPartyLoginConnection.getSharedInstance()!
      .rx.login
      .map { _ in
        NaverThirdPartyLoginConnection.getSharedInstance().accessToken
      }
      // error logging
      .catch { err in
        os_log(.debug, log: .user, "Naver Login Error: %s", String(describing: err))
        return .error(err)
      }
  }

  /**
   OAuth 사용자 로그인 시도.

   존재하지 않는 회원 일 시, `UserServiceError.canNotFindUser` 전달
   이메일 동의하지 않았을 시, Token Invalid 오류 발생., `UserServiceError.denied` 전달

   - parameter type: 로그인할 타입.
   - parameter token: 사용할 토큰 문자열
   */
  static func oAuthLogin(type: UserAccount.Platform, token: String) -> Observable<Void> {
    os_log(.debug, log: .user, "oAuthLogin(type:token:)")
    return .create { subscriber in
      Network.shared.apollo.perform(mutation: AuthUserLoginMutation(platform_type: type.value, accesstoken: token)) {
        guard let _data = try? $0.get().data else {
          os_log(.info, log: .apollo, "Apollo Fetch Failed")
          subscriber.onError(UserServiceError.requestFailed)
          return
        }

        guard _data.authUserLogin?.ok == true else {
          // 미가입 유저
          guard let errCode = _data.authUserLogin?.error else {
            subscriber.onError(UserServiceError.unknown)
            return
          }

          switch errCode {
          case -303:
            os_log(.debug, log: .user, "Can not Find User")
            subscriber.onError(UserServiceError.canNotFindUser)
          // 이메일이 존재하지 않는 경우 발생
          case -503:
            os_log(.debug, log: .user, "Email Denied")
            subscriber.onError(UserServiceError.denied)

          default:
            os_log(.fault, log: .user, "ErrorCode: %d", errCode)
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

  // 이메일을 요청
  ///
  /// 이메일을 자동으로 받아오지 못할 시에 재요청
  /// 메일 수집을 위해 설정
  static func getKakaoEmail() -> Observable<String> {
    os_log(.debug, log: .user, "getKakaoEmail()")

    return UserApi.shared.rx.me()
      .map { user -> String in
        var scopes = [String]()

        if user.kakaoAccount?.emailNeedsAgreement == true { scopes.append("account_email") }
        if scopes.count > 0 {
          os_log(.debug, log: .default, "getKakaoEmail: Thorw")
          throw SdkError(scopes: scopes)
        } else if let mail = user.kakaoAccount?.email {
          os_log(.debug, log: .default, "getKakaoEmail: return Mail")
          return mail
        } else {
          throw SdkError(scopes: scopes)
        }
      }
      .retry(when: Auth.shared.rx.incrementalAuthorizationRequired())
      .asObservable()
      // 에러 확인
      .catch {
        os_log(.debug, log: .default, "getKakaoEmail: Catch")
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

  // MARK: Private

  // 카카오 로그인 및 토큰 획득.
  private static func _kakaoLogin() -> Observable<OAuthToken> {
    os_log(.debug, log: .user, "kakaoGetToken()")
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
