//
//  LoadingAlert.swift
//  Travelog
//
//  Created by JK on 2021/07/25.
//

import Lottie
import RxSwift
import UIKit

// MARK: - LoadingAlert

final class LoadingAlert {

  // MARK: Internal

  static let shared = LoadingAlert()

  var isLoading = false

  class func start() {
    guard let window = UIApplication.shared.windows.last else { return }

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

    shared.background = background
    shared.animation = animation
  }

  class func stop() {
    shared.animation?.stop()

    shared.background?.removeFromSuperview()
    shared.animation?.removeFromSuperview()
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
        Base.start()
      } else {
        Base.stop()
      }

    }
  }
}
