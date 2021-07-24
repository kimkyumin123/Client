//
//  UIColor+Extension.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import Foundation
import UIKit.UIColor

extension UIColor {

  // MARK: Lifecycle

  public convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: a)
  }

  public convenience init(hex: Int) {
    self.init(r: (hex & 0xFF0000) >> 16, g: (hex & 0xFF00) >> 8, b: hex & 0xFF, a: 1)
  }

  // MARK: Public

  public var hex: Int {
    var r: CGFloat = 0
    var g: CGFloat = 0
    var b: CGFloat = 0
    var a: CGFloat = 0

    getRed(&r, green: &g, blue: &b, alpha: &a)
    let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0
    return rgb
  }
}
