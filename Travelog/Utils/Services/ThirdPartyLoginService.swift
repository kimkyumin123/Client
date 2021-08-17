//
//  ThirdPartyLoginService.swift
//  ThirdPartyLoginService
//
//  Created by JK on 2021/08/17.
//

import Apollo
import Foundation
import KakaoSDKAuth
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

  static func kakaoLogin() -> Observable<OAuthToken> {
    // kakaotalk 설치 여부 확인
    if UserApi.isKakaoTalkLoginAvailable() {
      os_log(.debug, log: .user, "Login with KakaoTalk")
      return UserApi.shared.rx.loginWithKakaoTalk()
    } else {
      os_log(.debug, log: .user, "Login with KakaoAccount")
      return UserApi.shared.rx.loginWithKakaoAccount()
    }
  }

  /**
    OAuth 사용자 로그인 시도.

    미가입된 사용자일 시 회원가입으로 유도됨.
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
           if _data.authUserLogin?.error == -303 {
             UserServiceError.canNotFindUser
           }
         }

         subscriber.onNext(())
       }

       return Disposables.create()
     }
   }
    */

}
