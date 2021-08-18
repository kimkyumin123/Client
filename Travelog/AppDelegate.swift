//
//  AppDelegate.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import NaverThirdPartyLogin
import os.log
import RxKakaoSDKCommon
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  // MARK: Internal

  func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    initializeLogin()

    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_: UIApplication, didDiscardSceneSessions _: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }

  // MARK: Private

  private func initializeLogin() {
    switch UserDefaults.loginPlatform {
    case .naver:
      initNaver()
    case .kakao:
      initKakao()
    case .notLoggedIn:
      initNaver()
      initKakao()
    default:
      break
    }
  }

  // kakao initialize
  private func initKakao() {
    os_log(.debug, log: .user, "Initialize Kakao Login, %s", Constraints.kakaoAppKey)
    RxKakaoSDKCommon.initSDK(appKey: Constraints.kakaoAppKey)
  }

  // naver initialize
  private func initNaver() {
    os_log(.debug, log: .user, "Initialize Naver Login")
    let instance = NaverThirdPartyLoginConnection.getSharedInstance()
    instance?.isNaverAppOauthEnable = true
    instance?.isInAppOauthEnable = true
    instance?.isOnlyPortraitSupportedInIphone()

    instance?.serviceUrlScheme = kServiceAppUrlScheme
    instance?.consumerKey = kConsumerKey
    instance?.consumerSecret = kConsumerSecret
    instance?.appName = kServiceAppName
  }
}
