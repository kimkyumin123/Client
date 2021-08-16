//
//  Error+Extension.swift
//  Travelog
//
//  Created by JK on 2021/08/16.
//

import Foundation

extension Error {
  func cast<T: Error>(to _: T.Type) throws -> T {
    guard let err = self as? T else { throw self }
    return err
  }
}
