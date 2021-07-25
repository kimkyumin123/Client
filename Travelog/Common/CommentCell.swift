//
//  CommentCell.swift
//  Travelog
//
//  Created by JK on 2021/07/25.
//

import FlexLayout
import PinLayout
import UIKit

// MARK: - CommentCell

final class CommentCell: UITableViewCell {

  // MARK: Lifecycle

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
  override init(style _: UITableViewCell.CellStyle, reuseIdentifier _: String?) {
    super.init(style: .default, reuseIdentifier: Self.identifier)
    configLayout()
  }

  // MARK: Internal

  private(set) lazy var profileImage = UIImageView().then {
    $0.layer.cornerRadius = Self.profileImageSize * 0.5
    $0.clipsToBounds = true
    $0.backgroundColor = .systemGray3
  }

  private(set) lazy var nickname = UILabel().then {
    let pointSize = UIFont.preferredFont(forTextStyle: .body).pointSize
    $0.font = .systemFont(ofSize: pointSize, weight: .semibold)
    $0.numberOfLines = 1
  }

  private(set) lazy var text = UILabel().then {
    $0.numberOfLines = 0
    $0.lineBreakMode = .byWordWrapping
    $0.font = .preferredFont(forTextStyle: .subheadline)
  }

  private(set) lazy var thumbUpCount = UILabel().then {
    $0.font = .preferredFont(forTextStyle: .caption1)
  }

  private(set) lazy var thumbDownCount = UILabel().then {
    $0.font = .preferredFont(forTextStyle: .caption1)
  }

  private(set) lazy var decorateView = UIView()

  override var reuseIdentifier: String? { Self.identifier }

  // MARK: Private

  static private let profileImageSize: CGFloat = 35.0

}

extension CommentCell {

  // MARK: Internal

  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }

  override func sizeThatFits(_ size: CGSize) -> CGSize {
    contentView.pin.width(size.width)
    layout()

    return contentView.frame.size }

  override func prepareForReuse() {
    super.prepareForReuse()
    profileImage.image = nil
    text.text = nil
    nickname.text = nil
    thumbUpCount.text = nil
    thumbDownCount.text = nil
  }

  // MARK: Private

  private func configLayout() {
    selectionStyle = .none
    separatorInset = .zero

    contentView.flex.padding(15).define {
      $0.addItem().direction(.row)
        .justifyContent(.start).alignItems(.start).define {
          $0.addItem(profileImage).width(Self.profileImageSize).aspectRatio(1.0)
            .marginRight(8)
          $0.addItem().direction(.column).shrink(1).grow(1).define {
            $0.addItem(nickname).markDirty()
              .marginBottom(5)
            $0.addItem(text).markDirty()
              .marginBottom(20)

            $0.addItem().direction(.row).justifyContent(.start).alignItems(.center).define {
              let thumbUp = UIImageView(image: UIImage(systemName: "hand.thumbsup"))
              thumbUp.tintColor = .label
              let thumbDown = UIImageView(image: UIImage(systemName: "hand.thumbsdown"))
              thumbDown.tintColor = .label

              let imageSize = Self.profileImageSize * 0.5

              $0.addItem(thumbUp).width(imageSize).aspectRatio(1.0)
              $0.addItem(thumbUpCount).minWidth(15).marginHorizontal(10)

              $0.addItem(thumbDown).width(imageSize).aspectRatio(1.0)
              $0.addItem(thumbDownCount).minWidth(15).marginHorizontal(10)
            }
          }
        }
    }
  }

  private func layout() {
    contentView.flex.layout(mode: .adjustHeight)
  }
}
