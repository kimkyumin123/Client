//
//  AppFlow.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import os.log
import RxFlow
import UIKit

// MARK: - AppFlow

final class AppFlow: Flow {

  // MARK: Lifecycle

  init(window: UIWindow) {
    self.window = window
  }

  // MARK: Internal

  var root: Presentable { window }

  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppSteps else { return .none }
    switch step {
    case .homeIsRequired:
      return navigateToMain()
    case .loginIsRequierd:
      return navigateToLogin()
    default:
      return .none
    }
  }

  // MARK: Private

  private var window: UIWindow
}

// MARK: - Navigating

extension AppFlow {
  private func navigateToMain() -> FlowContributors {
    os_log(.debug, log: .flow, "[AppFlow]  navigateToMain")
    let flow = HomeFlow()
    Flows.use(flow, when: .created) { root in
      self.window.rootViewController = root
    }

    return .one(flowContributor: .contribute(
      withNextPresentable: flow,
      withNextStepper: OneStepper(withSingleStep: AppSteps.homeIsRequired))
    )
  }

  private func navigateToLogin() -> FlowContributors {
    os_log(.debug, log: .flow, "[AppFlow]  navigateToLogin")
    let flow = LoginFlow()

    Flows.use(flow, when: .created) { root in
      self.window.rootViewController = root
    }

    return .one(flowContributor: .contribute(
      withNextPresentable: flow,
      withNextStepper: OneStepper(withSingleStep: AppSteps.loginIsRequierd))
    )
  }
}
