//
//  HomeFlow.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import RxFlow
import UIKit

// MARK: - HomeFlow

final class HomeFlow: Flow {

  // MARK: Internal

  var root: Presentable { rootViewController }

  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppSteps else { return .none }
    switch step {
    case .homeIsRequired:
      return navigateToHome()
    default:
      return .none
    }
  }

  // MARK: Private

  private let rootViewController = UITabBarController()

}

// MARK: -  Navigating

extension HomeFlow {
  private func navigateToHome() -> FlowContributors {
    let mapFlow = MapFlow()
    let timelineFlow = TimelineFlow()
    let userInfoFlow = UserInfoFlow()

    Flows.use(timelineFlow, mapFlow, userInfoFlow, when: .created) { [unowned self] timelineRoot, mapRoot, userInfoRoot in
      let timelineItem = UITabBarItem(
        title: "Timeline", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper.fill"))
      let mapItem = UITabBarItem(
        title: "Map", image: UIImage(systemName: "map"), selectedImage: UIImage(systemName: "map.fill"))
      let userInfoItem = UITabBarItem(
        title: "UserInfo", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))

      timelineRoot.tabBarItem = timelineItem
      mapRoot.tabBarItem = mapItem
      userInfoRoot.tabBarItem = userInfoItem

      self.rootViewController.setViewControllers([timelineRoot, mapRoot, userInfoRoot], animated: false)
    }

    return .multiple(flowContributors: [
      .contribute(
        withNextPresentable: timelineFlow,
        withNextStepper: OneStepper(withSingleStep: AppSteps.timelineIsRequired)),
      .contribute(
        withNextPresentable: mapFlow,
        withNextStepper: OneStepper(withSingleStep: AppSteps.mapScreenIsRequired)),
      .contribute(
        withNextPresentable: userInfoFlow,
        withNextStepper: OneStepper(withSingleStep: AppSteps.userInfoIsRequired)),
    ])
  }
}
