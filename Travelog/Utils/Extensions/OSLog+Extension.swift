//
//  OSLog+Extension.swift
//  Travelog
//
//  Created by JK on 2021/08/11.
//

import Foundation
import os.log

extension OSLog {

  // MARK: Internal

  static let keychain = OSLog(subsystem: subsystem, category: "📂 KeyChain")
  static let apollo = OSLog(subsystem: subsystem, category: "👩‍🎤 GraphQL")
  static let user = OSLog(subsystem: subsystem, category: "👤 User")
  static let flow = OSLog(subsystem: subsystem, category: "🖥 Flow")

  // MARK: Private

  private static let subsystem = Bundle.main.bundleIdentifier!
}
