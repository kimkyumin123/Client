//
//  PostWriteViewController.swift
//  Travelog
//
//  Created by JK on 2021/09/16.
//

import ReactorKit
import RxSwift
import UIKit

// MARK: - PostWriteViewController

final class PostWriteViewController: UIViewController, View {

  // MARK: Internal

  var disposeBag = DisposeBag()

  override func loadView() {
    super.loadView()
    view = contentView
  }

  func bind(reactor: PostWriteViewModel) {
    bindView(reactor: reactor)
    bindAction(reactor: reactor)
    bindState(reactor: reactor)
  }

  // MARK: Private

  private let contentView = PostWriteView()
}

// MARK: Binding

extension PostWriteViewController {
  private func bindView(reactor: PostWriteViewModel) {}
  private func bindAction(reactor: PostWriteViewModel) {}
  private func bindState(reactor: PostWriteViewModel) {}
}
