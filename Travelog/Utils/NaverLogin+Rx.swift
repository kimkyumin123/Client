//
//  NaverLogin+Rx.swift
//
//  Created by JK on 2021/08/19.
//

import Foundation
import NaverThirdPartyLogin
import os.log
import RxCocoa
import RxSwift

extension Reactive where Base: NaverThirdPartyLoginConnection {

  // MARK: Public

  /**
   로그인을 시도합니다.

   로그인 성공시 `.complete` 실패 시, `.error(Error)` 를 반환합니다.
   */
  public var login: Observable<Void> {
    os_log(.debug, log: .naverLogin, "Login: Completable")

    let proxy = RxNaverThirdPartyLoginConnectionProxy.proxy(for: base)
    base.requestThirdPartyLogin()

    return proxy.login
  }

  /**
   Access Token 갱신을 시도합니다.

   갱신 성공시 `.complete` 실패 시, `.error(Error)` 를 반환합니다.
   */
  public var refreshToken: Observable<Void> {
    os_log(.debug, log: .naverLogin, "RefreshToken: Completable")

    let proxy = RxNaverThirdPartyLoginConnectionProxy.proxy(for: base)
    base.requestAccessTokenWithRefreshToken()

    return proxy.refresh
  }

  /**
   연결 해제를 요청합니다.

   성공시 `.complete`, 실패 시, `.error(Error)` 를 반환합니다.

   */
  public var disconnect: Observable<Void> {
    os_log(.debug, log: .naverLogin, "RefreshToken: Completable")

    let proxy = RxNaverThirdPartyLoginConnectionProxy.proxy(for: base)
    base.requestDeleteToken()

    return proxy.disconnect
  }

  // MARK: Private

  /// `NaverThirdPartyLoginConnectionDelegate` 를 `DelegateProxy` 로 전달합니다.
  private var delegate: DelegateProxy<NaverThirdPartyLoginConnection, NaverThirdPartyLoginConnectionDelegate> {
    RxNaverThirdPartyLoginConnectionProxy.proxy(for: base)

  }

}

// MARK: - RxNaverThirdPartyLoginConnectionProxy

final class RxNaverThirdPartyLoginConnectionProxy: DelegateProxy<NaverThirdPartyLoginConnection, NaverThirdPartyLoginConnectionDelegate>,
  DelegateProxyType,
  NaverThirdPartyLoginConnectionDelegate
{

  // MARK: Lifecycle

  public init(object: NaverThirdPartyLoginConnection) {
    os_log(.debug, log: .naverLogin, "init(object:)")
    loginConnection = object
    super.init(parentObject: object, delegateProxy: RxNaverThirdPartyLoginConnectionProxy.self)
  }

  // MARK: Public

  public weak private(set) var loginConnection: NaverThirdPartyLoginConnection?

  public var login: Observable<Void> {
    _loginSubject.asObservable()
  }

  public var refresh: Observable<Void> {
    _refresh.asObservable()
  }

  public var disconnect: Observable<Void> {
    _disconnect.asObservable()
  }

  // MARK: Internal

  static func registerKnownImplementations() {
    os_log(.debug, log: .naverLogin, "registerKnownImplementations()")
    register { RxNaverThirdPartyLoginConnectionProxy(object: $0) }
  }

  static func currentDelegate(for object: NaverThirdPartyLoginConnection) -> NaverThirdPartyLoginConnectionDelegate? {
    os_log(.debug, log: .naverLogin, "currentDelegate(for:)")
    return object.delegate
  }

  static func setCurrentDelegate(_ delegate: NaverThirdPartyLoginConnectionDelegate?, to object: NaverThirdPartyLoginConnection) {
    os_log(.debug, log: .naverLogin, "setCurrentDelegate(_:)")
    object.delegate = delegate
  }

  func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
    os_log(.debug, log: .naverLogin, "oauth20ConnectionDidFinishRequestACTokenWithAuthCode()")
    _loginSubject.onNext(())
  }

  func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
    os_log(.debug, log: .naverLogin, "oauth20ConnectionDidFinishRequestACTokenWithRefreshToken()")
    _loginSubject.onNext(())
    _refresh.onNext(())
  }

  func oauth20ConnectionDidFinishDeleteToken() {
    os_log(.debug, log: .naverLogin, "oauth20ConnectionDidFinishDeleteToken()")
    _disconnect.onNext(())
  }

  func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
    guard let err = error else { return }
    os_log(.debug, log: .naverLogin, "oauth20Connection(_:didFailWithError:)")
    _loginSubject.onError(err)
    _refresh.onError(err)
    _disconnect.onError(err)
  }

  // MARK: Private

  private lazy var _loginSubject = PublishSubject<Void>()
  private lazy var _refresh = PublishSubject<Void>()
  private lazy var _disconnect = PublishSubject<Void>()

}

extension OSLog {
  fileprivate static let naverLogin = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "NaverLogin")
}
