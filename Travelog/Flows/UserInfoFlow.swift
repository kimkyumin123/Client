//
//  UserInfoFlow.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import RxFlow
import UIKit

// MARK: - UserInfoFlow

final class UserInfoFlow: Flow {

  lazy var rootViewController = UINavigationController()

  var root: Presentable { rootViewController }

  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppSteps else { return .none }
    switch step {
    case .userInfoIsRequired:
      return navigateTouserInfo()
    default:
      return .none
    }
  }
}

// MARK: - Navigating
extension UserInfoFlow {
  private func navigateTouserInfo() -> FlowContributors {
    let vc = UserInfoViewController()
    let vm = UserInfoViewModel()
    rootViewController.setViewControllers([vc], animated: false)
    return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
  }
}
