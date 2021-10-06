//
//  SceneDelegate.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import KakaoSDKAuth
import NaverThirdPartyLogin
import os.log
import RxFlow
import RxKakaoSDKAuth
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  // MARK: Internal

  var window: UIWindow?
  let coordinator = FlowCoordinator()

  func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let _window = UIWindow(windowScene: windowScene)
    window = _window
    coordinator.coordinate(flow: AppFlow(window: _window), with: AppStepper())
    _window.makeKeyAndVisible()
  }

  func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    loginRedirect(url: URLContexts.first?.url)

  }

  func sceneDidDisconnect(_: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }

  // MARK: Private

  private func loginRedirect(url: URL?) {
    if let url = url {
      // naver login
      if
        NaverThirdPartyLoginConnection
          .getSharedInstance()
          .isNaverThirdPartyLoginAppschemeURL(url)
      {
        os_log(.debug, log: .user, "Naver handleOpenUrl")
        NaverThirdPartyLoginConnection
          .getSharedInstance()
          .receiveAccessToken(url)

        // kakao login
      } else if AuthApi.isKakaoTalkLoginUrl(url) {
        os_log(.debug, log: .user, "Kakao handleOpenUrl")
        _ = AuthController.rx.handleOpenUrl(url: url)
      }
    }
  }

  private func kakaoLoginUrl(url: URL?) {
    if
      let url = url,
      AuthApi.isKakaoTalkLoginUrl(url)
    {
      _ = AuthController.rx.handleOpenUrl(url: url)
    }
  }
}
