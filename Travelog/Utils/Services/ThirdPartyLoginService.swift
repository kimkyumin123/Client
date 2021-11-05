//
//  ThirdPartyLoginService.swift
//  ThirdPartyLoginService
//
//  Created by JK on 2021/08/17.
//

import Alamofire
import Apollo
import Foundation
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser
import NaverThirdPartyLogin
import os.log
import RxAlamofire
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

  static func oAuthSignUp(type: UserAccount.Platform, token: String, fields: UserAccount.OAuthSignUpFields) -> Completable {
    os_log(.debug, log: .user, "oAuthSignUp(type:token:fields:)")

    let mutation = CreateAuthUserMutation(
      nickName: fields.nickName,
      avatar: "avatar",
      bio: fields.bio,
      platformType: type.value,
      token: token)

    let query: Maybe<CreateAuthUserMutation.Data>
    if let data = fields.avatar {
      let image = GraphQLFile(fieldName: "avatar", originalName: "image", data: data)
      query = Network.shared.apollo.rx.upload(operation: mutation, files: [image])
    } else {
      query = Network.shared.apollo.rx.perform(mutation: mutation)
    }

    return query
      .map { $0.createAuthUser?.ok == true }
      .catch { _ in .error(UserServiceError.requestFailed) }
      .asObservable()
      .ignoreElements()
      .asCompletable()
  }

  /**
   카카오 토큰 획득을 시도합니다. 토큰이 비정상적이라면, 로그인을 시도합니다.
   */
  static func kakaoLogin() -> Observable<String> {
    os_log(.debug, log: .user, "kakaoLogin()")
    if AuthApi.hasToken() {
      return UserApi.shared.rx.accessTokenInfo()
        .compactMap { _ -> String? in
          TokenManager.manager.getToken()?.accessToken
        }
        .asObservable()
        .catch { _ in kakaoLoginAndAccessMail() }
    } else {
      return kakaoLoginAndAccessMail()
    }
  }

  /**
   카카오 로그인 + 메일 권한 요청
   */
  static func kakaoLoginAndAccessMail() -> Observable<String> {
    os_log(.debug, log: .user, "kakaoLoginAndAccessMail()")
    return _kakaoLogin()
      .map(\.accessToken)
      // 이메일 획득 시도
      .flatMap { token -> Observable<String> in
        getKakaoEmail()
          .map { _ in token }
      }
  }

  /**
   네이버 로그인을 시도합니다.
   성공 시 토큰 반환.
   */
  static func naverLogin() -> Observable<String> {
    os_log(.debug, log: .user, "naverLogin()")
    return NaverThirdPartyLoginConnection.getSharedInstance()!
      .rx.login
      .flatMap { _ in
        getNaverToken()
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
  static func oAuthLogin(type: UserAccount.Platform, token: String) -> Observable<(accessToken: JWTToken, refreshToken: JWTToken)> {
    os_log(.debug, log: .user, "oAuthLogin(type:token:)")
    return .create { subscriber in
      Network.shared.apollo.perform(mutation: OAuthUserLoginMutation(platform_type: type.value, accesstoken: token)) {
        guard let _data = try? $0.get().data else {
          os_log(.info, log: .apollo, "Apollo Fetch Failed")
          subscriber.onError(UserServiceError.requestFailed)
          return
        }

        guard
          _data.authUserLogin?.ok == true,
          let token = _data.authUserLogin?.token else
        {
          // 미가입 유저
          guard let errCode = _data.authUserLogin?.error else {
            subscriber.onError(UserServiceError.unknown)
            return
          }

          // 존재하지 않는 사용자
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

        // 토큰 생성
        guard
          let accessToken = JWTToken(value: token.accessToken),
          let refreshToken = JWTToken(value: token.refreshToken) else
        {
          os_log(.fault, log: .user, "Token Creation Error")
          subscriber.onError(UserServiceError.invalidToken)
          return
        }

        subscriber.onNext((accessToken, refreshToken))
      }

      return Disposables.create()
    }
    .do(onNext: { access, refresh in
      UserService.updateLoginInfo(id: "", platform: type, accessToken: access.value, refreshToken: refresh.value)
    })
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
  /**
   "https://openapi.naver.com/v1/nid/me" 경로로 요청 후의 응답을 전달받습니다.
   */
  static func getNaverInfo() -> Observable<UserAccount.NaverInfoResponse> {
    os_log(.debug, log: .user, "getNaverInfo()")
    let url = "https://openapi.naver.com/v1/nid/me"
    return NaverThirdPartyLoginConnection.getSharedInstance()!
      .rx.token
      .flatMap { token -> Observable<UserAccount.NaverInfoResponse> in
        RxAlamofire
          .requestData(.get, url, parameters: nil, headers: [.authorization(bearerToken: token)], interceptor: nil)
          .flatMap({ response, data -> Observable<UserAccount.NaverInfoResponse> in
            guard
              (200..<300).contains(response.statusCode),
              let info = try? JSONDecoder().decode(UserAccount.NaverInfoResponse.self, from: data) else
            {
              return .error(UserServiceError.canNotFindUser)
            }

            guard info.resultcode == "00" else {
              return .error(UserServiceError.canNotFindUser)
            }

            return .just(info)
          })
      }

  }

  /**
   네이버 인증 토큰을 전달받습니다.

   토큰이 존재하지 않을 시, 갱신합니다.
   */
  static func getNaverToken() -> Observable<String> {
    os_log(.debug, log: .user, "getNaverToken()")
    return NaverThirdPartyLoginConnection.getSharedInstance()!
      .rx.token
  }

  static func kakaoLogout() -> Completable {
    os_log(.debug, log: .user, "kakaoLogout()")
    return UserApi.shared
      .rx.logout()
  }

  static func kakaoDisconnect() -> Completable {
    os_log(.debug, log: .user, "kakaoDisconnect()")
    return UserApi.shared
      .rx.unlink()
  }

  static func naverLogout() {
    os_log(.debug, log: .user, "naverLogout()")
    return NaverThirdPartyLoginConnection.getSharedInstance()!
      .resetToken()
  }

  static func naverDisconnect() -> Completable {
    os_log(.debug, log: .user, "naverDisconnect()")
    return NaverThirdPartyLoginConnection.getSharedInstance()!
      .rx.disconnect
      .ignoreElements()
      .asCompletable()
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
