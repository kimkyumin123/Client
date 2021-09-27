// 
//  DetailPostView.swift
//  Travelog
//
//  Created by JK on 2021/09/22.
//

import FlexLayout
import PinLayout
import UIKit

// MARK: - DetailPostView

final class DetailPostView: UIView {
  @available(*, unavailable)
  required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
  init() {
    super.init(frame: .zero)
    configLayout()
  }
  
  // MARK: Internal
  private let container = UIView()
}

// MARK: - Layout

extension DetailPostView {
  
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
