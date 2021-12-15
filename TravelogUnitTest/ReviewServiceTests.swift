//
//  ReviewServiceTests.swift
//  TravelogUnitTest
//
//  Created by JK on 2021/10/31.
//

import Foundation
import Photos
import RxBlocking
import XCTest
@testable import Travelog

final class ReviewServiceTests: XCTestCase {
  func testUpload() {
    // login

//    _ = UserService.login(id: "user304", pw: "pGg#2w6YsxMjCZLW")
//      .toBlocking(timeout: 5.0)
//      .materialize()

    let reviews = [
      ReviewInput(
        title: "title",
        content: "content",
        place: InputPlace(
          title: "title",
          address: "address",
          zipCode: 16325,
          x: 3.3,
          y: 4.4,
          category: "string",
          placeId: "placeID"),
        hashtags: nil),
    ]

    let first = ReviewService.write(post: reviews, images: [getAsset()])
      .toBlocking(timeout: 5.0)
      .materialize()

    guard case .completed = first else {
      XCTFail()
      return
    }

  }

  func getAsset() -> PHAsset {
    let options = PHFetchOptions()
    options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
    let allPhotos = PHAsset.fetchAssets(with: options)

    return allPhotos.object(at: 0)
  }
}
