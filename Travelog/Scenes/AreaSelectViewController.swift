//
//  AreaSelectViewController.swift
//  Travelog
//
//  Created by JK on 2021/10/14.
//

import Foundation
import UIKit

// MARK: - AreaSelectDelegate

protocol AreaSelectDelegate {
  func set(area: String)
}

// MARK: - AreaSelectViewController

final class AreaSelectViewController: UIViewController {

  // MARK: Internal

  var delegate: AreaSelectDelegate?

  override func loadView() {
    super.loadView()
    view = contentView
  }

  // MARK: Private

  private let contentView = AreaSelectView()
}
