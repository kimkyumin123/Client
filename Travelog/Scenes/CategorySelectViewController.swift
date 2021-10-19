//
//  CategorySelectViewController.swift
//  Travelog
//
//  Created by JK on 2021/10/14.
//

import Foundation
import RxFlow
import RxRelay
import UIKit

// MARK: - CategorySelectDelegate

protocol CategorySelectDelegate {
  func set(category: String)
}

// MARK: - CategorySelectViewController

final class CategorySelectViewController: UIViewController, Stepper {

  // MARK: Internal

  var steps = PublishRelay<Step>()
  var category: String?

  var delegate: CategorySelectDelegate?

  override func loadView() {
    super.loadView()
    view = contentView
  }

  // MARK: Private

  private let contentView = CategorySelectView()
}
