//
//  TimelineView.swift
//  Travelog
//
//  Created by JK on 2021/09/15.
//

import FlexLayout
import PinLayout
import UIKit

// MARK: - TimelineView

final class TimelineView: UIView {

  // MARK: Lifecycle

  @available(*, unavailable)
  required init?(coder _: NSCoder) { fatalError("init(coder:) has not been implemented") }
  init() {
    super.init(frame: .zero)
    configLayout()
  }

  // MARK: Internal

  let tableView = UITableView()

  // MARK: Private

  private let container = UIView()
}

// MARK: - Layout

extension TimelineView {

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

    container.flex.define {
      $0.addItem(tableView).width(100%).height(100%).markDirty()
    }
  }
}
