//
//  UserServiceTests.swift
//  UserServiceTests
//
//  Created by JK on 2021/08/16.
//

import Apollo
import Foundation
import Photos
import RxBlocking
import RxSwift
import XCTest
@testable import Travelog

// MARK: - UserServiceTest

final class UserServiceTest: XCTestCase {

  /// 로그인 시도, 토큰 획득 확인
  func testLogin() throws {
    // given
    let testID = "testName"
    let testPW = "password!1234"
    signUp(id: testID, pw: testPW)

    // when
    let observable = UserService.login(id: testID, pw: testPW)

    // then
    let result = try observable.toBlocking(timeout: 5.0).first()
    XCTAssertEqual(result?.accessToken.value, try KeychainService.read(key: .accessToken))
    XCTAssertEqual(result?.refreshToken.value, try KeychainService.read(key: .refreshToken))
    XCTAssertNotNil(result)
  }

  /// 사용자 정보 조회
  func testSeeProfile() {
    // given
    let testName = "testName"

    // when
    let observable = UserService.seeProfile(userName: testName)

    // then
    let result = try? observable.toBlocking(timeout: 5.0).first()
    XCTAssertNotNil(result?.id)
    XCTAssertEqual(result?.userName, testName)
  }

  /// 회원 탈퇴
  func testDeleteUser() throws {
    // given

    let testName = "testName"
    let testPW = "password!1234"
    signUp(id: testName, pw: testPW)

    // login
    let accessToken = try UserService.login(id: testName, pw: testPW).toBlocking(timeout: 3.0).first()?.accessToken
    XCTAssertEqual(try KeychainService.read(key: .accessToken), accessToken?.value)
    XCTAssertEqual(UserDefaults.loginPlatform, .service)
    XCTAssertNotEqual(UserDefaults.userID, "")

    // when
    let observable = UserService.deleteUser()

    // then
    _ = try observable.toBlocking(timeout: 5.0).first()!
    XCTAssertEqual(UserDefaults.loginPlatform, .notLoggedIn)
    XCTAssertEqual(UserDefaults.userID, "")
    XCTAssertNil(try? KeychainService.read(key: .accessToken))
    XCTAssertNil(try? KeychainService.read(key: .refreshToken))
  }

  /// 사용자 정보 수정
  func testEditUserInfo() throws {
    // given
    let testID = "testName"
    let testPW = "password!1234"
    signUp(id: testID, pw: testPW)

    let testNickName = "NEWNICKNAME"
    _ = try UserService.login(id: testID, pw: testPW).toBlocking(timeout: 3.0).first()

    let curretName = try UserService.seeProfile(userName: testID).toBlocking(timeout: 3.0).first()?.nickName

    let fields = UserAccount.UpdateFields(nickName: testNickName)

    // when
    _ = try UserService.updateUser(fields: fields).toBlocking(timeout: 3.0).first()

    let changedName = try UserService.seeProfile(userName: testID).toBlocking(timeout: 3.0).first()?.nickName
    XCTAssertNotNil(changedName)
    XCTAssertNotEqual(curretName, changedName)
  }

  /// Access / Refresh Token 토큰 갱신
  func testRenewToken() throws {
    let expectation = expectation(description: "Alamofire")
    _ = try UserService.login(id: "user02", pw: "passwd").toBlocking(timeout: 5.0).first()
    let prevToken = try KeychainService.read(key: .accessToken)
    UserService.renewToken { result in
      if case .success(let token) = result {
        XCTAssertTrue(prevToken != token.0)
        expectation.fulfill()
      }
    }

    wait(for: [expectation], timeout: 10.0)
  }

  func signUp(id: String, pw: String) {
    let testMail = "foo@bar.org"
    let testNick = "testNickname"
    let testName = id
    let testPW = pw

    let textForm = UserAccount.SignUpFields(
      userName: testName,
      bio: nil,
      gender: nil,
      ageRange: nil,
      email: testMail,
      nickName: testNick,
      avatar: nil,
      password: testPW)

    _ = try? UserService.createUser(fields: textForm).toBlocking(timeout: 3.0).first()
  }

  func testSignUpWithAvatar() throws {
    guard let image = PHAsset.fetchAssets(with: nil).firstObject else {
      throw NSError(domain: "imageError", code: 0, userInfo: nil)
    }

    let mail = "test@foo.bar"
    let nick = "testNickname"
    let id = "testID"
    let pw = "xptmxm#!00"

    let data = try PhotoService.data(from: image)
      .map { UserAccount.SignUpFields(userName: id, email: mail, nickName: nick, avatar: $0, password: pw) }
      .toBlocking()
      .first()!

    _ = try UserService.createUser(fields: data)
      .andThen(Observable.just(()))
      .toBlocking(timeout: 30.0)
      .first()
  }
}
