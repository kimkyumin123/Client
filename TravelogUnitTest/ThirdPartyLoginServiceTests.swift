//
//  ThirdPartyLoginServiceTests.swift
//  ThirdPartyLoginServiceTests
//
//  Created by JK on 2021/08/17.
//

import Foundation
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

  func testKakaoLoginTest() {
    // given
    let expect = expectation(description: "kakao login")

    // when
    ThirdPartyLoginService.kakaoLogin()
      .subscribe(onNext: { oAuthToken in
        print(oAuthToken.accessToken)
        expect.fulfill()
      })
      .disposed(by: disposeBag)

    // then
    wait(for: [expect], timeout: 300.0)
  }

  func testKakaoSignUpTest() { }
  func testCreationOAuth() {
  }
}
