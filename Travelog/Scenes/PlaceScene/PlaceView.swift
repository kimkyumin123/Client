//
//  PlaceView.swift
//  Travelog
//
//  Created by JK on 2021/10/08.
//

import FlexLayout
import PinLayout
import UIKit

// MARK: - PlaceView

final class PlaceView: UIView {

  // MARK: Lifecycle

  @available(*, unavailable)
  required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
  init() {
    super.init(frame: .zero)
    configLayout()
  }

  // MARK: Private

  private let container = UIView()
}

// MARK: - Layout

extension PlaceView {

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
  }
}
