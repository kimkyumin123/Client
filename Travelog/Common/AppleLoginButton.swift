//
//  AppleLoginButton.swift
//  Travelog
//
//  Created by JK on 2021/07/25.
//

import AuthenticationServices
import UIKit

// MARK: - AppleLoginButton

final class AppleLoginButton: UIButton {

  // MARK: Lifecycle

  @available(*, unavailable)
  required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
  init() {
    super.init(frame: .zero)
    configLayout()
  }

  // MARK: Internal

  enum State {
    case dark, white
  }

  let white = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .white)
  let dark = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)

    if previousTraitCollection?.userInterfaceStyle == .dark {
      self.switch(mode: .white)
    } else {
      self.switch(mode: .dark)
    }
  }

  // MARK: Private

  private func `switch`(mode: State) {
    switch mode {
    case .dark:
      dark.isHidden = true
      white.isHidden = false
    case .white:
      dark.isHidden = false
      white.isHidden = true
    }
  }

  private func configLayout() {
    addSubview(dark)
    addSubview(white)
    dark.translatesAutoresizingMaskIntoConstraints = false
    white.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      dark.topAnchor.constraint(equalTo: topAnchor).priority(.defaultHigh),
      dark.bottomAnchor.constraint(equalTo: bottomAnchor).priority(.defaultHigh),
      dark.leadingAnchor.constraint(equalTo: leadingAnchor).priority(.defaultHigh),
      dark.trailingAnchor.constraint(equalTo: trailingAnchor).priority(.defaultHigh),

      white.topAnchor.constraint(equalTo: topAnchor).priority(.defaultHigh),
      white.bottomAnchor.constraint(equalTo: bottomAnchor).priority(.defaultHigh),
      white.leadingAnchor.constraint(equalTo: leadingAnchor).priority(.defaultHigh),
      white.trailingAnchor.constraint(equalTo: trailingAnchor).priority(.defaultHigh),
    ])

    if UITraitCollection.current.userInterfaceStyle == .dark {
      self.switch(mode: .dark)
    } else {
      self.switch(mode: .white)
    }
  }
}
