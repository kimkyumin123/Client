//
//  PostWriteView.swift
//  Travelog
//
//  Created by JK on 2021/09/16.
//

import FlexLayout
import PinLayout
import UIKit

// MARK: - PostWriteView

final class PostWriteView: UIView {

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

extension PostWriteView {

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
