//
//  LoginViewController.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import UIKit

final class LoginViewController: UIViewController {

  // MARK: Internal

  override func loadView() {
    super.loadView()
    view = contentView
  }

  // MARK: Private

  private let contentView = LoginView()
}
