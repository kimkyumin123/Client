//
//  LoginView.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import AuthenticationServices
import FlexLayout
import PinLayout
import Then
import UIKit

// MARK: - LoginView

final class LoginView: UIView {

  // MARK: Lifecycle

  @available(*, unavailable)
  required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
  init() {
    super.init(frame: .zero)
    configLayout()
  }

  // MARK: Internal

  private(set) lazy var idInput = UITextField().then {
    $0.layer.cornerRadius = 5
    $0.backgroundColor = .systemGray
    $0.font = .preferredFont(forTextStyle: .callout)
  }

  private(set) lazy var pwInput = UITextField().then {
    $0.layer.cornerRadius = 5
    $0.backgroundColor = .systemGray
    $0.font = .preferredFont(forTextStyle: .callout)
  }

  private(set) lazy var loginButton = UIButton().then {
    $0.layer.cornerRadius = 5
    $0.backgroundColor = .systemGray
  }

  private(set) lazy var findAccount = UIButton().then {
    $0.setTitle("forget ID / PW ?", for: .normal)
    $0.titleLabel?.textColor = .white
    $0.titleLabel?.textAlignment = .center
    $0.backgroundColor = .systemBlue
    $0.layer.cornerRadius = 8
  }

  private(set) lazy var kakaoLogin = UIButton().then {
    $0.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9019607843, blue: 0.3019607843, alpha: 1) // #FAE64D
    $0.layer.cornerRadius = 8
  }

  private(set) lazy var naverLogin = UIButton().then {
    $0.backgroundColor = #colorLiteral(red: 0.3725490196, green: 0.8039215686, blue: 0.431372549, alpha: 1) // #5FCD6E
    $0.layer.cornerRadius = 8
  }

  private(set) lazy var appleLogin = AppleLoginButton()

  // MARK: Private

  private let container = UIView()
  private let title = UILabel().then {
    $0.text = "TraveLog"
    $0.font = .preferredFont(forTextStyle: .largeTitle)
    $0.numberOfLines = 1
    $0.textAlignment = .center
  }
}

// MARK: - Layout

extension LoginView {

  // MARK: Internal

  override func layoutSubviews() {
    super.layoutSubviews()
    container.pin.all(pin.safeArea)
    container.flex.layout()
  }

  // MARK: Private

  private func configLayout() {
    backgroundColor = .systemBackground

    container.flex.padding(20).alignItems(.center).define {
      $0.addItem(title).width(100%).marginTop(30).marginBottom(40).markDirty()

      $0.addItem().direction(.row).marginHorizontal(30).define { // login Area
        $0.addItem().direction(.column).define {
          $0.addItem(idInput).paddingVertical(10).paddingLeft(5).marginBottom(20).markDirty()
          $0.addItem(pwInput).paddingVertical(10).paddingLeft(5).markDirty()
        }
        .basis(75%).grow(1).marginRight(5%)

        $0.addItem(loginButton).basis(25%).shrink(1)
      }
      .marginBottom(30)

      $0.addItem(findAccount).width(65%).marginBottom(80)

      // OAuth Login
      $0.addItem().justifyContent(.spaceAround).width(70%).maxHeight(300).define {
        $0.addItem(kakaoLogin).height(45).marginBottom(20)

        $0.addItem(naverLogin).height(45).marginBottom(20)
        $0.addItem(appleLogin).height(45)
      }
    }
    addSubview(container)
  }
}
