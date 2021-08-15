//
//  SignUpViewController.swift
//  Travelog
//
//  Created by JK on 2021/08/14.
//

import ReactorKit
import RxSwift
import UIKit

// MARK: - SignUpViewController

final class SignUpViewController: UIViewController, View {

  // MARK: Internal

  var disposeBag = DisposeBag()

  override func loadView() {
    super.loadView()
    view = contentView
  }

  func bind(reactor: SignUpViewModel) {
    bindView(reactor: reactor)
    bindAction(reactor: reactor)
    bindState(reactor: reactor)
  }

  // MARK: Private

  private let contentView = SignUpView()
}

// MARK: Binding

extension SignUpViewController {
  private func bindView(reactor: SignUpViewModel) { }
  private func bindAction(reactor: SignUpViewModel) {}
  private func bindState(reactor: SignUpViewModel) {}
}
