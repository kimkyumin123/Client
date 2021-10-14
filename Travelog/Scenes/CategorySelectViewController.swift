//
//  CategorySelectViewController.swift
//  Travelog
//
//  Created by JK on 2021/10/14.
//

import Foundation
import UIKit

// MARK: - CategorySelectDelegate

protocol CategorySelectDelegate {
  func set(category: String)
}

// MARK: - CategorySelectViewController

final class CategorySelectViewController: UIViewController {

  // MARK: Internal

  var delegate: CategorySelectDelegate?

  override func loadView() {
    super.loadView()
    view = contentView
  }

  // MARK: Private

  private let contentView = CategorySelectView()
}
