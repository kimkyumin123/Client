//
//  FeedFlow.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import UIKit
import RxFlow

final class TimelineFlow: Flow {

  lazy var rootViewController = UINavigationController()
  var root: Presentable { self.rootViewController }
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppSteps else { return .none }
    switch step {
      case .timelineIsRequired:
        return navigateToTimeline()
      default:
        return .none
    }
  }
}


// MARK: - Navigating
extension TimelineFlow {
  private func navigateToTimeline() -> FlowContributors {
    let vc = TimelineViewController()
    let vm = TimelineViewModel()
    rootViewController.setViewControllers([vc], animated: false)
    return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
  }
}
