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

  private let categorySubject = PublishSubject<String>()
  private let areaSubject = PublishSubject<String>()

  private let contentView = SearchView()
}

// MARK: Binding

extension SearchViewController {
  private func bindView(reactor: SearchViewModel) {}
  private func bindAction(reactor: SearchViewModel) {
    // TODO: - searchController 텍스트 search 연결

    //subject 로 부터 category, area 받아와 reactor 로 전달
    categorySubject
      .map { Reactor.Action.setCategory($0) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    areaSubject
      .map { Reactor.Action.setArea($0) }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

  }
  private func bindState(reactor: SearchViewModel) {

    // places 지정
    // TODO: - tableView 바인딩
    _ = reactor.state.map(\.places)
      .distinctUntilChanged()
      .withUnretained(reactor)
      .filter { reactor, _ in reactor.currentState.segment == .place }

    // reviews 지정
    // TODO: - tableView 바인딩
    _ = reactor.state.map(\.reviews)
      .distinctUntilChanged()
      .withUnretained(reactor)
      .filter { reactor, _ in reactor.currentState.segment == .review }

  }
}

// MARK: CategorySelectDelegate

extension SearchViewController: CategorySelectDelegate {
  func set(category: String) {
    categorySubject.onNext(category)
  }
}

// MARK: AreaSelectDelegate

extension SearchViewController: AreaSelectDelegate {
  func set(area: String) {
    areaSubject.onNext(area)
  }
}
