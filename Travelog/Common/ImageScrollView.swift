//
//  ImageScrollView.swift
//  Travelog
//
//  Created by JK on 2021/07/25.
//

import Alamofire
import FlexLayout
import RxAlamofire
import RxSwift
import UIKit

// MARK: - ImageScrollView

final class ImageScrollView: UIView {

  // MARK: Lifecycle

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
  init() {
    super.init(frame: .zero)
    configLayout()
    addSubview(contianer)
  }

  convenience init(urls: [String]) {
    self.init()
    self.urls = urls
  }

  // MARK: Internal

  var urls = [String]() {
    didSet {
      configScrollView()
      imageDownload()
      configBinding()
    }
  }

  // MARK: Private

  private let scheduler = ConcurrentDispatchQueueScheduler(qos: .background)
  private let disposeBag = DisposeBag()

  private let contianer = UIView()
  private lazy var pageControl = UIPageControl().then {
    $0.pageIndicatorTintColor = .systemGray3
    $0.currentPageIndicatorTintColor = .systemBlue
  }

  private lazy var scrollView = UIScrollView().then {
    $0.alwaysBounceVertical = false
    $0.showsVerticalScrollIndicator = false
    $0.showsHorizontalScrollIndicator = false
    $0.isScrollEnabled = true
    $0.isPagingEnabled = true
    $0.alwaysBounceHorizontal = false
    $0.bounces = false
  }

  private lazy var imageViews: [UIImageView] = []

  private func configBinding() {
    pageControl.rx.controlEvent(.valueChanged)
      .observe(on: MainScheduler.instance)
      .withUnretained(self)
      .compactMap { ($0.0.pageControl.currentPage, true) }
      .subscribe(onNext: scrollView.setCurrentPage)
      .disposed(by: disposeBag)

    scrollView.rx.currentPage
      .observe(on: MainScheduler.instance)
      .bind(to: pageControl.rx.currentPage)
      .disposed(by: disposeBag)

  }

  // TODO: change download to caching
  /// 이미지 캐싱 구현 예정.
  // download image
  private func imageDownload() {
    for (i, url) in urls.enumerated() {
      RxAlamofire.requestData(.get, url)
        .subscribe(on: scheduler)
        .compactMap { UIImage(data: $0.1) }
        .withUnretained(self)
        .observe(on: MainScheduler.instance)
        .subscribe(onNext: { `self`, image in
          if self.imageViews.indices ~= i {
            self.imageViews[i].image = image
            self.setNeedsLayout()
          }
        })
        .disposed(by: disposeBag)
    }
  }

}

// MARK: - Layout
extension ImageScrollView {

  // MARK: Internal

  override func layoutSubviews() {
    super.layoutSubviews()

    contianer.pin.all(pin.safeArea)
    contianer.flex.layout()

    scrollView.contentSize.width = scrollView.bounds.width * CGFloat(imageViews.count)
  }

  // MARK: Private

  private func configLayout() {
    contianer.flex.alignItems(.center).define {
      $0.addItem(scrollView).width(100%).aspectRatio(1.0)
        .marginBottom(10)
      $0.addItem(pageControl).height(20)
    }
  }

  private func configScrollView() {
    imageViews = []
    for _ in urls { imageViews.append(UIImageView()) }

    scrollView.subviews.forEach { $0.removeFromSuperview() }
    pageControl.numberOfPages = imageViews.count

    scrollView.flex.direction(.row).define {
      for _imageView in imageViews {
        $0.addItem(_imageView).width(100%).aspectRatio(1.0).markDirty()
      }
    }
  }

}

extension Reactive where Base: UIScrollView {
  fileprivate var currentPage: Observable<Int> {
    didEndDecelerating
      .map {
        let pageWidth = self.base.bounds.width
        let page = floor((self.base.contentOffset.x - pageWidth / 2) / pageWidth + 1)
        return Int(page)
      }
  }
}

extension UIScrollView {
  fileprivate func setCurrentPage(_ page: Int, animated: Bool) {
    var rect = bounds
    rect.origin.x = rect.width * CGFloat(page)

    setContentOffset(rect.origin, animated: animated)
  }
}
