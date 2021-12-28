//
//  ReviewServiceTests.swift
//  TravelogUnitTest
//
//  Created by JK on 2021/10/31.
//

import Foundation
import Photos
import RxBlocking
import RxSwift
import XCTest
@testable import Travelog

final class ReviewServiceTests: XCTestCase {
  func testUpload() throws {
    // login

    if UserDefaults.loginPlatform == .notLoggedIn {
      _ = UserService.login(id: "testName", pw: "password!1234")
        .toBlocking(timeout: 5.0)
        .materialize()
    }

    let disposeBag = DisposeBag()

    let reviews = [
      ReviewInput(
        title: "title1",
        content: "content1",
        place: InputPlace(
          title: "place1",
          address: "address",
          zipCode: 16325,
          x: 3.3,
          y: 4.4,
          category: "string",
          placeId: "placeID"),
        hashtags: nil),
      ReviewInput(
        title: "title2",
        content: "content2",
        place: InputPlace(
          title: "place2",
          address: "address",
          zipCode: 16325,
          x: 3.3,
          y: 4.4,
          category: "string",
          placeId: "placeID"),
        hashtags: nil),
    ]

    let expectation = expectation(description: "reviewservice")

    ReviewService.write(post: reviews, images: [getAsset(), getAsset()])
      .subscribe(onCompleted: {
        expectation.fulfill()
      })
      .disposed(by: disposeBag)

    wait(for: [expectation], timeout: 30.0)
  }

  func getAsset() -> PHAsset {
    let options = PHFetchOptions()
    options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
    let allPhotos = PHAsset.fetchAssets(with: options)

    return allPhotos.object(at: 0)
  }
}
