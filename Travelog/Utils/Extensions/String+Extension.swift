//
//  String+Extension.swift
//  Travelog
//
//  Created by JK on 2021/08/16.
//

import Foundation

extension String {
  var bs64ToData: Data? {
    var text = self
    if text.count % 4 != 0 {
      let padlen = 4 - text.count % 4
      text += String(repeating: "=", count: padlen)
    }

    return Data(base64Encoded: text, options: [])
  }
}
