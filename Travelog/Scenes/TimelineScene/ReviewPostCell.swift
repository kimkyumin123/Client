//
//  ReviewPostCell.swift
//  Travelog
//
//  Created by JK on 2021/07/25.
//

import FlexLayout
import PinLayout
import UIKit

// MARK: - ReviewPostCell

final class ReviewPostCell: UIView {

  // MARK: Lifecycle

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
  override init(frame: CGRect) {
    super.init(frame: frame)
    configLayout()
    addSubview(container)
  }

  // MARK: Internal

  private(set) lazy var title = UILabel().then {
    let size = UIFont.preferredFont(forTextStyle: .title3).pointSize
    $0.font = .systemFont(ofSize: size, weight: .bold)
  }

  private(set) lazy var hashtag = UILabel().then {
    $0.font = .preferredFont(forTextStyle: .subheadline)
  }

  private(set) lazy var nickname = UILabel().then {
    $0.font = .preferredFont(forTextStyle: .body)
  }
  private(set) lazy var date = UILabel().then {
    $0.textColor = .systemGray2
    $0.font = .preferredFont(forTextStyle: .caption1)
  }

  private(set) lazy var profileImage = UIImageView().then {
    $0.layer.cornerRadius = 20
    $0.clipsToBounds = true
    $0.backgroundColor = .systemGray2
  }

  private(set) lazy var imageScrollView = ImageScrollView()

  // MARK: Private

  private let container = UIView()
}

// MARK: - Config Layout
extension ReviewPostCell {

  // MARK: Internal

  override func layoutSubviews() {
    super.layoutSubviews()
    container.pin.all(pin.safeArea)
    container.flex.layout()
  }

  // MARK: Private

  private func configLayout() {
    container.flex.padding(20).define {
      // title + hashtag
      $0.addItem().direction(.column).define {
        $0.addItem().direction(.row).define {
          $0.addItem(title).marginRight(15)
          $0.addItem(hashtag)
        }
        .marginBottom(25)

        // profile Area
        $0.addItem().alignItems(.center).justifyContent(.start).direction(.row).define {
          $0.addItem(profileImage).width(40).height(40).marginRight(10)
          $0.addItem(nickname).grow(1)

          $0.addItem(date)
        }
        .marginBottom(25)

        // border
        $0.addItem().height(1).backgroundColor(.systemGray)
          .marginBottom(30)

        // image scrollView
        $0.addItem(imageScrollView).width(100%).aspectRatio(1.0)
          .marginBottom(10)
      }
    }
  }

}
