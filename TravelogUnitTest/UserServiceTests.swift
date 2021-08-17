//
//  UserServiceTests.swift
//  UserServiceTests
//
//  Created by JK on 2021/08/16.
//

import Foundation
import RxBlocking
import RxSwift
import XCTest
@testable import Travelog

// MARK: - UserServiceTest

final class UserServiceTest: XCTestCase {
  var disposeBag: DisposeBag!

  func testLogin() {
    // given
    let testID = "testName"
    let testPW = "password!1234"

    // when
    let observable = UserService.login(id: testID, pw: testPW)

    // then
    let result = try? observable.toBlocking(timeout: 5.0).first()
    XCTAssertNotNil(result)
  }

  /// 로그인 시 전달받은 토큰이 정상적으로 디코딩 되는지 확인
  /**
   func testTokenDecoding() throws {
     // given
     let testID = "testName"
     let testPW = "password!1234"

     let apolloExpectation = expectation(description: "Apollo Mutation Failed")

     var accessTokenString: String?
     var refreshTokenString: String?

     Network.shared.apollo.perform(mutation: UserLoginMutation(userName: testID, password: testPW)) {
       guard let _data = try? $0.get().data, let data = _data.userLogin, data.ok == true else {
         return
       }

       accessTokenString = data.token?.accessToken
       refreshTokenString = data.token?.refreshToken
       apolloExpectation.fulfill()
     }

     wait(for: [apolloExpectation], timeout: 3.0)

     guard let accessTokenString = accessTokenString, let refreshTokenString = refreshTokenString else {
       try XCTSkipUnless(false, "토큰 획득 실패")
       return
     }

     // when
     // 디코딩
     let accessToken = Token(value: accessTokenString)
     let refreshToken = Token(value: refreshTokenString)

     XCTAssertNotNil(accessToken)
     XCTAssertNotNil(refreshToken)

     print(accessToken?.payload ?? "")
     print(refreshToken?.payload ?? "")
   }
    */
}
