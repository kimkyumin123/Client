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
  case findAccount
  case userIsLoggedIn

  // Home
  case homeIsRequired

  // Screens
  case feedIsRequired
  case mapScreenIsRequired
  case infoIsRequired

  case filterOptionRequired
  case filterSelected

  case searchIsRequired
  case searchPlaces
  case searchReviews
  case selectPlace
  case selectReview
}
