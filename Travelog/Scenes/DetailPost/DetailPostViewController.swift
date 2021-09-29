//
//  DetailPostViewController.swift
//  Travelog
//
//  Created by JK on 2021/09/22.
//

import ReactorKit
import RxSwift
import UIKit

// MARK: - DetailPostViewController

final class DetailPostViewController: UIViewController, View {

  // MARK: Internal

  var disposeBag = DisposeBag()

  override func loadView() {
    super.loadView()
    view = contentView
  }

  func bind(reactor: DetailPostViewModel) {
    bindView(reactor: reactor)
    bindAction(reactor: reactor)
    bindState(reactor: reactor)
  }

  // MARK: Private

  private let contentView = DetailPostView()
}

// MARK: Binding

extension DetailPostViewController {
  private func bindView(reactor: DetailPostViewModel) {}
  private func bindAction(reactor: DetailPostViewModel) {}
  private func bindState(reactor: DetailPostViewModel) {}
}
