//
//  Constraints.swift
//  Travelog
//
//  Created by JK on 2021/08/14.
//

import Foundation

// MARK: - Constraints

enum Constraints {
  static let serverAddr = "https://" + ((Bundle.main.infoDictionary?["SERVER_ADDR"] as? String) ?? "localhost")
  static let port = (Bundle.main.infoDictionary?["PORT"] as? String) ?? "4000"
  static let gqlAddr = serverAddr + ":\(port)/graphql"
}
