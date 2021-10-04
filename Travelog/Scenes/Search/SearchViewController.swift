//
//  SearchViewController.swift
//  Travelog
//
//  Created by JK on 2021/09/29.
//

import ReactorKit
import RxSwift
import UIKit

// MARK: - SearchViewController

final class SearchViewController: UIViewController, View {

  // MARK: Internal

  var disposeBag = DisposeBag()

  override func loadView() {
    super.loadView()
    view = contentView
  }

  func bind(reactor: SearchViewModel) {
    bindView(reactor: reactor)
    bindAction(reactor: reactor)
    bindState(reactor: reactor)
  }

  // MARK: Private

  private let contentView = SearchView()
}

// MARK: Binding

extension SearchViewController {
  private func bindView(reactor: SearchViewModel) {}
  private func bindAction(reactor: SearchViewModel) {}
  private func bindState(reactor: SearchViewModel) {}
}
