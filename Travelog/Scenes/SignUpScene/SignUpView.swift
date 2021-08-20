//
//  SignUpView.swift
//  Travelog
//
//  Created by JK on 2021/08/14.
//

import FlexLayout
import PinLayout
import UIKit

// MARK: - SignUpView

final class SignUpView: UIView {
  @available(*, unavailable)
  required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
  init() {
    super.init(frame: .zero)
    configLayout()
  }

  // MARK: Internal
}

// MARK: - Layout

extension SignUpView {

  // MARK: Internal

  override func layoutSubviews() {
    super.layoutSubviews()

    // container.pin.all(pin.safeArea)
    // container.flex.layout()
  }

  // MARK: Private

  private func configLayout() {
    backgroundColor = .systemBackground
  }
}
