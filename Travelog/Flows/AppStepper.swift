//
//  AppStepper.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import Foundation
import RxFlow
import RxRelay

final class AppStepper: Stepper {
  let steps = PublishRelay<Step>()

  // temp value
  var isLogined = false

  var initialStep: Step {
    isLogined ? AppSteps.homeIsRequired : AppSteps.loginIsRequierd
  }
}
