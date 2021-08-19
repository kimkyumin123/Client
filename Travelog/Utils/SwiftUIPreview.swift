//
//  SwiftUIPreview.swift
//  Travelog
//
//  Created by JK on 2021/07/26.
//

import UIKit

#if canImport(SwiftUI) && DEBUG

import SwiftUI
struct UIViewPreview<View: UIView>: UIViewRepresentable {
  let view: View
  init(_ builder: @escaping () -> View) {
    view = builder()
  }

  func makeUIView(context: Context) -> some UIView {
    view
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {
    view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    view.setContentHuggingPriority(.defaultHigh, for: .vertical)
  }
}

#endif
