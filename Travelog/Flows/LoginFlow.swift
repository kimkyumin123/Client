//
//  LoginFlow.swift
//  Travelog
//
//  Created by JK on 2021/07/25.
//

import RxFlow
import UIKit

// MARK: - LoginFlow

final class LoginFlow: Flow {
  lazy var rootViewController = UINavigationController().then {
    $0.navigationBar.isHidden = true
  }

  var root: Presentable { rootViewController }

  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppSteps else { return .none }
    switch step {
    case .loginIsRequierd:
      return navigateToLogin()
    default:
      return .none
    }
  }
}

// MARK: - Navigating

extension LoginFlow {
  private func navigateToLogin() -> FlowContributors {
    let vc = LoginViewController()
    let vm = LoginViewModel()
    rootViewController.setViewControllers([vc], animated: false)
    return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
  }
}
