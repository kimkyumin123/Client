//
//  AppFlow.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import UIKit
import RxFlow

final class AppFlow: Flow {

  private var window: UIWindow
  var root: Presentable { self.window }

  init(window: UIWindow) {
    self.window = window
  }

  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppSteps else { return .none }
    switch step {
      case .homeIsRequired:
        return navigateToMain()
      case .loginIsRequierd:
        return navigateToMain()
      default:
        return .none
    }
  }
}

// MARK: - Navigating

extension AppFlow {
  private func navigateToMain() -> FlowContributors {
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
    // TODO: Login Scene 구현 시 추가
    return navigateToMain()
  }

}
