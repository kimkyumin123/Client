//
//  PlaceCell.swift
//  Travelog
//
//  Created by JK on 2021/07/26.
//

import FlexLayout
import PinLayout
import Then
import UIKit

// MARK: - PlaceCell

final class PlaceCell: UITableViewCell {

  // MARK: Lifecycle

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
  override init(style _: UITableViewCell.CellStyle, reuseIdentifier _: String?) {
    super.init(style: .default, reuseIdentifier: Self.identifier)
    configLayout()
  }

  // MARK: Internal

  private(set) lazy var placeImage = UIImageView().then {
    $0.layer.cornerRadius = 8
    $0.clipsToBounds = true
    $0.backgroundColor = .systemGray3
    $0.contentMode = .scaleAspectFit
  }
  private(set) lazy var title = UILabel().then {
    let size = UIFont.preferredFont(forTextStyle: .body).pointSize
    $0.font = .boldSystemFont(ofSize: size * 0.8)
  }
  private(set) lazy var hashtag = UILabel().then {
    let size = UIFont.preferredFont(forTextStyle: .subheadline).pointSize
    $0.font = .systemFont(ofSize: size * 0.7, weight: .semibold)
  }
  private(set) lazy var reviewCount = UILabel().then {
    let size = UIFont.preferredFont(forTextStyle: .caption1).pointSize
    $0.font = .systemFont(ofSize: size, weight: .regular)
  }
}

// MARK: - Layout

extension PlaceCell {

  // MARK: Internal

  override func layoutSubviews() {
    super.layoutSubviews()
    contentView.flex.layout()
  }

  // MARK: Private

  private func configLayout() {
    contentView.flex.define {
      $0.addItem().padding(15).direction(.row).justifyContent(.start).define {
        $0.addItem(placeImage).height(100%).aspectRatio(1.2) .alignSelf(.center).marginRight(12)
        $0.addItem().direction(.column)
          .justifyContent(.spaceEvenly).alignItems(.start).grow(1).define {
            $0.addItem(title)
            $0.addItem(hashtag)
            $0.addItem(reviewCount)
          }

        let mapIcon = UIImageView(image: UIImage(systemName: "map"))
        mapIcon.tintColor = .label
        $0.addItem(mapIcon).width(15).aspectRatio(1.0).alignSelf(.center)
      }
    }
  }
}

// MARK: - Will Remove

#if canImport(SwiftUI) && DEBUG

import RxAlamofire
import RxSwift
import SwiftUI

struct Preview: PreviewProvider {
  static let disposeBag = DisposeBag()

  static var previews: some View {
      UIViewPreview {
        let cell = PlaceCell()
        cell.title.text = "This is title"
        cell.hashtag.text = "#hashtag"
        cell.reviewCount.text = "3개의 후기가 있습니다."

        RxAlamofire.requestData(.get, "https://picsum.photos/500/500")
          .compactMap { UIImage(data: $0.1) }
          .bind(to: cell.placeImage.rx.image)
          .disposed(by: disposeBag)

        return cell
      }
      .previewLayout(.fixed(width: 375, height: 100))
  }
}
#endif
