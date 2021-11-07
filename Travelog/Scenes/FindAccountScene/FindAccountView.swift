//
//  FindAccountView.swift
//  Travelog
//
//  Created by JK on 2021/11/06.
//

import FlexLayout
import PinLayout
import UIKit

// MARK: - FindAccountView

final class FindAccountView: UIView {

  // MARK: Lifecycle

  @available(*, unavailable)
  required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
  init() {
    super.init(frame: .zero)
    configLayout()
  }

  // MARK: Internal

  let container = UIView()

  let findIDTextfield = UITextField()
  let findPWTextfield = UITextField()
  let findIDButton = UIButton()
  let findPWButton = UIButton()
}

// MARK: - Layout

extension FindAccountView {

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
