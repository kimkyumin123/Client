//
//  AppSteps.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import Foundation
import RxFlow

enum AppSteps: Step {
  // Auth
  case loginIsRequierd
  case signUp
  case oAuthSignUp
  case findAccount
  case userIsLoggedIn

  // Home
  case homeIsRequired

  // Screens
  case timelineIsRequired
  case mapScreenIsRequired
  case userInfoIsRequired

  case filterOptionRequired
  case filterSelected

  // Filter option
  case categoryIsRequired
  case areaIsRequired
  case setCategory(String)
  case setArea(String)

  case searchIsRequired
  case searchPlaces
  case searchReviews
  case selectPlace(id: Int)
  case selectReview(id: Int)
}
