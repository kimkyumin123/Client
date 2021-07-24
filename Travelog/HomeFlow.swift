//
//  HomeFlow.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import UIKit
import RxFlow

final class HomeFlow: Flow {
  var root: Presentable { self.rootViewController }
  private let rootViewController = UITabBarController()

  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppSteps else { return .none }
    switch step {
      case .homeIsRequired:
        return navigateToHome()
      default:
        return .none
    }
  }
}

// MARK: -  Navigating

extension HomeFlow {
  private func navigateToHome() -> FlowContributors {
    return .none
  }
}
