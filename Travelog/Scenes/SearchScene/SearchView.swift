//
//  SearchView.swift
//  Travelog
//
//  Created by JK on 2021/09/29.
//

import FlexLayout
import PinLayout
import UIKit

// MARK: - SearchView

final class SearchView: UIView {

  // MARK: Lifecycle

  @available(*, unavailable)
  required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
  init() {
    super.init(frame: .zero)
    configLayout()
  }

  // MARK: Internal

  let categroy = UIView()

  // MARK: Private

  private let container = UIView()
}

// MARK: - Layout

extension SearchView {

  // MARK: Internal

  override func layoutSubviews() {
    super.layoutSubviews()

    container.pin.all(pin.safeArea)
    container.flex.layout()
  }

  // MARK: Private

  private func configLayout() {
    backgroundColor = .systemBackground
    addSubview(container)

    container.flex.addItem(categroy).alignItems(.center).size(100)
  }
}
