//
//  LoadingAlert.swift
//  Travelog
//
//  Created by JK on 2021/07/25.
//

import Lottie
import os.log
import RxSwift
import UIKit

// MARK: - LoadingAlert

final class LoadingAlert {

  // MARK: Lifecycle

  private init(window: UIView) {
    os_log("🎲 LoadingAlert init")
    self.window = window
  }

  deinit { os_log("🎲 LoadingAlert deinit") }

  // MARK: Internal

  static let front = LoadingAlert.attach(at: UIApplication.shared.windows.last!)

  var isLoading = false
  var window: UIView

  static func attach(at view: UIView) -> LoadingAlert {
    LoadingAlert(window: view)
  }

  func start() {
    let background = UIView().with {
      $0.backgroundColor = .init(white: 0, alpha: 0.2)
      $0.frame = window.bounds
      $0.center = window.center
    }

    let animation = AnimationView(name: "loading").with {
      $0.frame = .init(x: 0, y: 0, width: 150, height: 150)
      $0.center = window.center
    }

    window.addSubview(background)
    window.addSubview(animation)

    animation.play(toProgress: 1, loopMode: .loop)

    self.background = background
    self.animation = animation
  }

  func stop() {
    animation?.stop()

    background?.removeFromSuperview()
    animation?.removeFromSuperview()
  }

  // MARK: Private

  private var background: UIView?
  private var animation: AnimationView?

}

// MARK: ReactiveCompatible

extension LoadingAlert: ReactiveCompatible { }
extension Reactive where Base: LoadingAlert {
  var isLoading: Binder<Bool> {
    Binder(base) { alert, isLoading in
      alert.isLoading = isLoading

      if isLoading {
        base.start()
      } else {
        base.stop()
      }
    }
  }
}
