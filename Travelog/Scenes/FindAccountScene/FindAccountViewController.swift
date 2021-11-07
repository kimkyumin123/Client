//
//  FindAccountViewController.swift
//  Travelog
//
//  Created by JK on 2021/11/06.
//

import ReactorKit
import RxSwift
import UIKit

// MARK: - FindAccountViewController

final class FindAccountViewController: UIViewController, View {

  // MARK: Internal

  var disposeBag = DisposeBag()

  override func loadView() {
    super.loadView()
    view = contentView
  }

  func bind(reactor: FindAccountViewModel) {
    bindView(reactor: reactor)
    bindAction(reactor: reactor)
    bindState(reactor: reactor)
  }

  // MARK: Private

  private let contentView = FindAccountView()
}

// MARK: Binding

extension FindAccountViewController {
  private func bindView(reactor: FindAccountViewModel) {}
  private func bindAction(reactor: FindAccountViewModel) {}
  private func bindState(reactor: FindAccountViewModel) {}
}
