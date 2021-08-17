//
//  Constraints.swift
//  Travelog
//
//  Created by JK on 2021/08/14.
//

import Foundation

// MARK: - Constraints

enum Constraints {
  static let serverAddr = "http://" + ((Bundle.main.infoDictionary?["SERVER_ADDR"] as? String) ?? "localhost")
  static let port = (Bundle.main.infoDictionary?["PORT"] as? String) ?? "5000"
  static let gqlAddr = serverAddr + ":\(port)/graphql"

  static let kakaoAppKey = (Bundle.main.infoDictionary?["KAKAO_APPKEY"] as? String ?? "nil")
}
