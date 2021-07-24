//
//  MapFlow.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import UIKit
import RxFlow

final class MapFlow: Flow {

  lazy var rootViewController = UINavigationController()
  var root: Presentable { self.rootViewController }
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppSteps else { return .none }
    switch step {
      case .mapScreenIsRequired:
        return navigateToMap()
      default:
        return .none
    }
  }
}


// MARK: - Navigating
extension MapFlow {
  private func navigateToMap() -> FlowContributors {
    let vc = MapViewController()
    let vm = MapViewModel()
    rootViewController.setViewControllers([vc], animated: false)
    return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
  }
}
