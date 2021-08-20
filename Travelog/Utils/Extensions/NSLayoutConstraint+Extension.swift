//
//  NSLayoutConstraint+Extension.swift
//  Travelog
//
//  Created by JK on 2021/07/25.
//

import UIKit

extension NSLayoutConstraint {
  func priority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
    self.priority = priority
    return self
  }
}
