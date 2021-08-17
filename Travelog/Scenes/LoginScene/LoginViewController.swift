//
//  LoginViewController.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import NaverThirdPartyLogin
import RxSwift
import UIKit

// MARK: - LoginViewController

final class LoginViewController: UIViewController {

  // MARK: Internal

  override func loadView() {
    super.loadView()
    view = contentView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    /// naver login
    contentView.naverLogin
      .rx.tap
      .subscribe(onNext: {
        NaverThirdPartyLoginConnection.getSharedInstance().requestThirdPartyLogin()
      })
      .disposed(by: disposeBag)

    contentView.kakaoLogin
      .rx.tap
      .flatMap {
        ThirdPartyLoginService.kakaoLogin()
      }
      .subscribe(onNext: {
        print($0.accessToken)
      })
      .disposed(by: disposeBag)
  }

  // MARK: Private

  private let contentView = LoginView()
  private let disposeBag = DisposeBag()

}
