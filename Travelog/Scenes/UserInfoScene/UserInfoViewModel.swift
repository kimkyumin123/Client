//
//  UserInfoViewModel.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import Foundation
import RxFlow
import RxRelay

final class UserInfoViewModel: Stepper {
  var steps = PublishRelay<Step>()
}
