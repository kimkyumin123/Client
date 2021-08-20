//
//  ThirdPartyLoginServiceTests.swift
//  ThirdPartyLoginServiceTests
//
//  Created by JK on 2021/08/17.
//

import Alamofire
import Foundation
import KakaoSDKAuth
import KakaoSDKUser
import RxAlamofire
import RxKakaoSDKAuth
import RxKakaoSDKUser
import RxSwift
import XCTest
@testable import Travelog

/// TDD 가 아닙니다. 테스팅용.
final class ThirdPartyLoginServiceTests: XCTestCase {
  var disposeBag: DisposeBag!

  override func setUp() {
    super.setUp()
    disposeBag = DisposeBag()
  }

  override func tearDown() {
    disposeBag = nil
    super.tearDown()
  }

  func testKakaoLoginTest() throws {
    // given
    guard let token = try ThirdPartyLoginService.kakaoLogin().toBlocking(timeout: 3.0).first() else {
      XCTFail("토큰 획득 실패")
      return
    }

    // when
    let action = ThirdPartyLoginService.oAuthLogin(type: .kakao, token: token)

    // then
    let result = try action.toBlocking(timeout: 3.0).first()
    XCTAssertNotNil(result)
  }

  func testKakaoSignUpTest() throws {
    // given
    let token = try ThirdPartyLoginService.kakaoLogin().toBlocking(timeout: 3.0).first()!
    guard let email = try UserApi.shared.rx.me().map(\.kakaoAccount?.email).toBlocking(timeout: 3.0).first()! else {
      XCTFail("이메일 획득 실패")
      return
    }
    let fields = UserAccount.OAuthSignUpFields(nickName: "kakaoNick", email: email, avatar: nil, bio: nil)

    // when
    let result = try ThirdPartyLoginService
      .oAuthSignUp(type: .kakao, token: token, fields: fields).toBlocking(timeout: 3.0).first()

    // then
    XCTAssertEqual(result, true)
  }

  func testNaverSignup() throws {
    // given
    guard
      let token = try ThirdPartyLoginService.getNaverToken().toBlocking(timeout: 5.0).first(),
      let email = try ThirdPartyLoginService.getNaverInfo().compactMap(\.response?.email).toBlocking(timeout: 3.0).first() else
    {
      XCTFail()
      return
    }
    print("🚀\t", token)
    print("🚀\t", email)
    print(token)

    let fields = UserAccount.OAuthSignUpFields(nickName: "OAuthTestNickName", email: email, avatar: nil, bio: nil)

    // when
    let result = try ThirdPartyLoginService.oAuthSignUp(
      type: .naver,
      token: token,
      fields: fields)
      .toBlocking(timeout: 5.0).first()

    // then
    XCTAssertNotNil(result)
  }

  func testfuncNaverLogin() throws {
    // givne
    guard let token = try ThirdPartyLoginService.getNaverToken().toBlocking(timeout: 5.0).first() else {
      XCTFail()
      return
    }

    // when
    let result = try ThirdPartyLoginService.oAuthLogin(type: .naver, token: token).toBlocking(timeout: 5.0).first()

    // then
    XCTAssertNotNil(result)
  }
}
