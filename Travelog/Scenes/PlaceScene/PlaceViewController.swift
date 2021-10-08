//
//  PlaceViewController.swift
//  Travelog
//
//  Created by JK on 2021/10/08.
//

import ReactorKit
import RxSwift
import UIKit

// MARK: - PlaceViewController

final class PlaceViewController: UIViewController, View {

  // MARK: Internal

  var disposeBag = DisposeBag()

  override func loadView() {
    super.loadView()
    view = contentView
  }

  func bind(reactor: PlaceViewModel) {
    bindView(reactor: reactor)
    bindAction(reactor: reactor)
    bindState(reactor: reactor)
  }

  // MARK: Private

  private let contentView = PlaceView()
}

// MARK: Binding

extension PlaceViewController {
  private func bindView(reactor: PlaceViewModel) {}
  private func bindAction(reactor: PlaceViewModel) {}
  private func bindState(reactor: PlaceViewModel) {}
}
