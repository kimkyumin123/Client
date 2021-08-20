//
//  NSObject+Extension.swift
//  Travelog
//
//  Created by JK on 2021/07/25.
//

import Foundation

extension NSObject {
  static var identifier: String {
    String(describing: Self.self)
  }
}
