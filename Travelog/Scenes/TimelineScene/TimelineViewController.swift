//
//  TimelineViewController.swift
//  Travelog
//
//  Created by JK on 2021/09/15.
//

import ReactorKit
import RxSwift
import UIKit

// MARK: - TimelineViewController

final class TimelineViewController: UIViewController, View {

  // MARK: Internal

  var disposeBag = DisposeBag()

  override func loadView() {
    super.loadView()
    view = contentView
  }

  func bind(reactor: TimelineViewModel) {
    bindView(reactor: reactor)
    bindAction(reactor: reactor)
    bindState(reactor: reactor)
  }

  // MARK: Private

  private let contentView = TimelineView()
}

// MARK: Binding

extension TimelineViewController {
  private func bindView(reactor: TimelineViewModel) { }
  private func bindAction(reactor: TimelineViewModel) {

    // 스크롤에 맞추어 추가 로딩 요청
    contentView.tableView.rx.contentOffset
      .withUnretained(self)
      .filter { `self`, offset in
        guard self.contentView.tableView.frame.height > 0 else { return false }
        return offset.y + self.contentView.tableView.frame.height >= self.contentView.tableView.contentSize.height - 100
      }
      .map { _ in Reactor.Action.loadNextPage }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
  }

  private func bindState(reactor: TimelineViewModel) {

    // loading
    reactor.state.map(\.isLoading)
      .distinctUntilChanged()
      .bind(to: LoadingAlert.shared.attach().rx.isLoading)
      .disposed(by: disposeBag)

    // TODO: - 타임라인 셀 채우기
    reactor.state.map(\.posts)
      .bind(to: contentView.tableView.rx.items(cellIdentifier: ReviewPostCell.identifier)) { _, _, _ in
        // 작성자, 프로필, 시각, 이미지 게시글.
      }
      .disposed(by: disposeBag)
  }
}
