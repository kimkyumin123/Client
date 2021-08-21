//
//  LoginFlow.swift
//  Travelog
//
//  Created by JK on 2021/07/25.
//

import os.log
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
    case .signUp, .oAuthSignUp:
      return navigateToSignUp()
    case .homeIsRequired:
      return navigateToHome()
    default:
      return .none
    }
  }
}

// MARK: - Navigating

extension LoginFlow {
  private func navigateToLogin() -> FlowContributors {
    os_log(.debug, log: .flow, "[LoginFlow]  navigateToLogin")
    let vc = LoginViewController()
    let vm = LoginViewModel()
    vc.reactor = vm

    rootViewController.setViewControllers([vc], animated: false)
    return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
  }

  private func navigateToSignUp() -> FlowContributors {
    os_log(.debug, log: .flow, "[LoginFlow]  navigateToSignUp")
    let vc = SignUpViewController()
    let vm = SignUpViewModel()
    vc.reactor = vm

    rootViewController.navigationBar.isHidden = false

    rootViewController.pushViewController(vc, animated: true)
    return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
  }

  private func navigateToHome() -> FlowContributors {
    os_log(.debug, log: .flow, "[LoginFlow]  navigateToHome")
    return .end(forwardToParentFlowWithStep: AppSteps.homeIsRequired)
  }
}
