//
//  SignUpTests.swift
//  TravelogUnitTest
//
//  Created by JK on 2021/08/14.
//

import Apollo
import RxBlocking
import RxSwift
import RxTest
import XCTest
@testable import Travelog

// MARK: - SignUpTests

class SignUpTests: XCTestCase {
  typealias Reactor = SignUpViewModel

  var sut: Reactor!

  var disposeBag = DisposeBag()

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = SignUpViewModel()
    // 일반적으로는 백그라운드 에서 동작
    sut.scheduler = MainScheduler.instance
  }

  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }

  /// 패스워드에는 영어 / 숫자 / 특수문자로 8자 이상이어야 함.

  /// 입력된 패스워드는 동일해야 함.
  /// 실패
  func testConfirmPasswordFailed() {
    // given
    let pw1 = "hello!123"
    let pw2 = "helo!1243"

    // when
    sut.action.onNext(.update(.password(pw1, pw2)))

    // then
    let result = sut.state.map(\.isValidPassword).toBlocking(timeout: 2.0)
    XCTAssertEqual(try? result.first(), UserService.ValidType.passwordNotSame)
  }
  /// 성공
  func testConfirmPassword() {
    // given
    let pw1 = "hello!123"
    let pw2 = "hello!123"

    // when
    sut.action.onNext(.update(.password(pw1, pw2)))

    // then
    let result = sut.state.map(\.isValidPassword).toBlocking(timeout: 2.0)
    XCTAssertEqual(try? result.first(), .valid)
  }

  ///  패스워드 길이 문제
  func testPasswordTooShrot() {
    // given
    let testPW = "abc!123"

    // when
    sut.action.onNext(.update(.password(testPW, testPW)))

    // then
    let result = sut.state.map(\.isValidPassword).toBlocking(timeout: 2.0)
    XCTAssertEqual(try? result.first(), .tooShort)

  }

  /// 패스워드는 문자 / 숫자 / 특수문자로 구성되어야 함.
  func testPassworNeedSpecialCharNumberd() {
    // given
    let testPW = "abcabc123123"

    // when
    sut.action.onNext(.update(.password(testPW, testPW)))

    // then
    let result = sut.state.map(\.isValidPassword).toBlocking(timeout: 2.0)
    XCTAssertEqual(try? result.first(), .needSpecialCharNumber)
  }

  /// 이메일 형식 확인
  func testEmailValidationFailed() {
    // given
    let testMail = "foo@bar"

    // when
    sut.action.onNext(.update(.email(testMail)))

    // then
    let result = sut.state.map(\.isValidEmail).toBlocking(timeout: 2.0)
    XCTAssertEqual(try? result.first(), .invalid)
  }

  func testEmailValidationSuccess() {
    // given
    let testMail = "fooabc@bar.com"

    // when
    sut.action.onNext(.update(.email(testMail)))

    // then
    let result = sut.state.map(\.isValidEmail).compactMap { $0 }.toBlocking(timeout: 3.0)
    XCTAssertEqual(try? result.first(), .valid)
  }

  // TODO: API 를 위한 Mock 객체 추가 예정정
  // UITest 에서 필요한 부분, 이동 예정
  /// 서버에 중복 요청 확인
  func testEmailAlreadyExists() throws {
    // given
    let apolloExpectation = expectation(description: "apollo")
    var mutationResult: Result<GraphQLResult<CreateUserMutation.Data>, Error>?
    let testEmail = "foo@bar.com"

    /// 중복확인을 위해 계정을 미리 생성함.
    let mutation = CreateUserMutation(
      bio: nil,
      userName: "userName01",
      gender: nil,
      ageRange: nil,
      email: testEmail,
      nickName: "foo",
      avatar: nil,
      password: "password#123")

    Network.shared.apollo.perform(mutation: mutation) {
      // mutatoin 성공, result 가 ok
      mutationResult = $0
      apolloExpectation.fulfill()
    }
    wait(for: [apolloExpectation], timeout: 3.0)

    // GQL 쿼리 실패
    guard case .success(let _data) = mutationResult, let preMutationResult = _data.data?.createUser else {
      try XCTSkipUnless(false, "GQL Mutation 실패")
      return
    }

    // 이미 존재하거나, 생성 성공
    guard preMutationResult.ok || (-199 ... -100).contains(preMutationResult.error ?? 0) else {
      try XCTSkipUnless(false, "GQL 계정 생성 실패")
      return
    }

    // when
    sut.action.onNext(.update(.email(testEmail)))

    // then
    let result = sut.state.map(\.isValidEmail).compactMap { $0 }.toBlocking(timeout: 3.0)
    XCTAssertEqual(try? result.first(), .alreadyExists)
  }

  /// 닉네임 중복 확인
  // TODO: API 를 위한 Mock 객체 추가 예정
  func testNicknameAlreadyExists() throws {
    let apolloExpectation = expectation(description: "apollo")
    var mutationResult: Result<GraphQLResult<CreateUserMutation.Data>, Error>?
    let testNickname = "nickname"

    /// 중복확인을 위해 계정을 미리 생성함.
    let mutation = CreateUserMutation(
      bio: nil,
      userName: "userName",
      gender: nil,
      ageRange: nil,
      email: "foo2@bar.com",
      nickName: testNickname,
      avatar: nil,
      password: "password")

    Network.shared.apollo.perform(mutation: mutation) {
      // mutatoin 성공, result 가 ok
      mutationResult = $0
      apolloExpectation.fulfill()
    }
    wait(for: [apolloExpectation], timeout: 3.0)

    // GQL 쿼리 실패
    guard case .success(let _data) = mutationResult, let preMutationResult = _data.data?.createUser else {
      try XCTSkipUnless(false, "GQL Mutation 실패")
      return
    }

    // 이미 존재하거나, 생성 성공
    guard preMutationResult.ok || (-199 ... -100).contains(preMutationResult.error ?? 0) else {
      try XCTSkipUnless(false, "GQL 계정 생성 실패")
      return
    }

    // when
    sut.action.onNext(.update(.nickname(testNickname)))

    // then
    /// 첫번째 닉네임 요청할때 변화는 무시하기 위해 `compactMap` 사용.
    let result = sut.state.map(\.isValidNickname).compactMap { $0 }.toBlocking(timeout: 3.0)
    XCTAssertEqual(try? result.first(), .alreadyExists)
  }

  /// 회원가입 확인
  func testSignUp() throws {
    // given
    let testMail = "foo@bar.org"
    let testName = "testName"
    let testNick = "testNickname"
    let testPW = "password!1234"

    sut.action.onNext(.update(.email(testMail)))
    sut.action.onNext(.update(.nickname(testNick)))
    sut.action.onNext(.update(.password(testPW, testPW)))
    sut.action.onNext(.update(.userID(testName)))

    let nickValidation = try sut.state.map(\.isValidNickname).compactMap { $0 }.toBlocking(timeout: 5.0).first()
    let mailValidation = try sut.state.map(\.isValidEmail).compactMap { $0 }.toBlocking(timeout: 5.0).first()
    let pwValidation = try sut.state.map(\.isValidPassword).compactMap { $0 }.toBlocking(timeout: 5.0).first()
    let userIDValidation = try sut.state.map(\.isValidUsername).compactMap { $0 }.toBlocking(timeout: 5.0).first()
    try XCTSkipUnless(nickValidation == .valid && mailValidation == .valid && pwValidation == .valid && userIDValidation == .valid)

    // when
    sut.action.onNext(.submit)

    // then
    // 첫번째 는 loading 상황이기 때문에 무시함.
    let result = sut.state.map(\.isSignUpSucceed).take(2).toBlocking(timeout: 5.0)
    XCTAssertEqual(try result.last(), true)
  }

}
