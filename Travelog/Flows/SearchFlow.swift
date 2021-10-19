//
//  SearchFlow.swift
//  Travelog
//
//  Created by JK on 2021/10/08.
//

import Foundation
import os.log
import ReactorKit
import RxFlow
import UIKit

// MARK: - SearchFlow

final class SearchFlow: Flow {
  lazy var rootViewController = UINavigationController()

  var root: Presentable { rootViewController }

  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppSteps else { return .none }

    switch step {
    case .searchPlaces, .searchReviews:
      return navigateToSearch()
    case .selectReview(let id):
      return navigateToReview(id: id)
    case .selectPlace(let id):
      return navigateToPlace(id: id)
    case .categoryIsRequired:
      return navigateToCategorySelect()
    case .areaIsRequired:
      return navigateToAreaSelect()
    // TODO: -  exit 하는 step 에서 .end 필요
    default:
      return .none
    }
  }

}

// MARK: - Navigating

extension SearchFlow {
  private func navigateToSearch() -> FlowContributors {
    os_log(.debug, log: .flow, "Navigate to Search")

    for vc in rootViewController.viewControllers {
      if let vc = vc as? SearchViewController, let vm = vc.reactor {
        rootViewController.popToViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
      }
    }

    let vc = SearchViewController()
    let vm = SearchViewModel()
    vc.reactor = vm

    rootViewController.setViewControllers([vc], animated: true)

    return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
  }

  private func navigateToReview(id: Int) -> FlowContributors {
    os_log(.debug, log: .flow, "Navigate to Review")
    let vc = DetailPostViewController()
    // TODO: - vm 에 post id 필요
    let vm = DetailPostViewModel()
    vc.reactor = vm

    rootViewController.pushViewController(vc, animated: true)

    return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
  }

  private func navigateToPlace(id: Int) -> FlowContributors {
    os_log(.debug, log: .flow, "Navigate to Place")
    let vc = PlaceViewController()
    let vm = PlaceViewModel(id: id)
    vc.reactor = vm

    rootViewController.pushViewController(vc, animated: true)

    return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
  }

  private func navigateToCategorySelect() -> FlowContributors {
    os_log(.debug, log: .flow, "Navigate to Category selecting")

    for currentVC in rootViewController.viewControllers.reversed() {
      if let currentVC = currentVC as? CategorySelectDelegate {
        let vc = CategorySelectViewController()
        vc.delegate = currentVC
        rootViewController.pushViewController(vc, animated: true)
      }
    }

    return .none
  }
  
  private func navigateToAreaSelect() -> FlowContributors {
    os_log(.debug, log: .flow, "Navigate to Category selecting")

    for currentVC in rootViewController.viewControllers.reversed() {
      if let currentVC = currentVC as? AreaSelectDelegate {
        let vc = AreaSelectViewController()
        vc.delegate = currentVC
        rootViewController.pushViewController(vc, animated: true)
      }
    }
    
    return .none
  }
}
