//
//  LoginViewController.swift
//  Travelog
//
//  Created by JK on 2021/08/18.
//

import os.log
import ReactorKit
import RxGesture
import RxSwift
import UIKit

// MARK: - LoginViewController

final class LoginViewController: UIViewController, View {

  // MARK: Internal

  var disposeBag = DisposeBag()

  override func loadView() {
    super.loadView()
    view = contentView
  }

  func bind(reactor: LoginViewModel) {
    bindView(reactor: reactor)
    bindAction(reactor: reactor)
    bindState(reactor: reactor)
  }

  // MARK: Private

  private let contentView = LoginView()
}

// MARK: Binding

extension LoginViewController {
  private func bindView(reactor: LoginViewModel) {}

  private func bindAction(reactor: LoginViewModel) {

    contentView.kakaoLogin
      .rx.tap
      .map { Reactor.Action.kakaoLogin }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

  }

  private func bindState(reactor: LoginViewModel) {
    reactor.state
      .observe(on: MainScheduler.instance)
      .map(\.isLoading)
      .distinctUntilChanged()
      .subscribe(onNext: {
        print("🚀Loading State: \($0)")
      })
      .disposed(by: disposeBag)

    reactor.state
      .distinctUntilChanged(at: \.error.rev)
      .compactMap(\.error.error)
      .observe(on: MainScheduler.instance)
      .subscribe(onNext: errorHandle)
      .disposed(by: disposeBag)
  }
}

extension LoginViewController {
  private func errorHandle(err: Error) {
    os_log(.debug, log: .default, "errorHandle")
    print(err)

    guard let err = err as? UserServiceError else { return }
    switch err {
    case .denied:
      alert(title: "이메일 수집 안내", msg: "고유 식별정보로 이메일을 사용하고 있어요.\n 이메일을 허용해주세요.", action: { _ in })
    default:
      break
    }
  }

  private func alert(title: String, msg: String, action: @escaping (UIAlertAction) -> Void) {
    let controller = UIAlertController(title: title, message: msg, preferredStyle: .alert)
    let confirmAction = UIAlertAction(title: "확인", style: .default, handler: action)
    controller.addAction(confirmAction)

    present(controller, animated: true, completion: nil)
  }
}
