//
//  PlaceServiceTests.swift
//  TravelogUnitTest
//
//  Created by JK on 2021/08/24.
//

import RxAlamofire
import RxBlocking
import RxSwift
import XCTest
@testable import Travelog

class PlaceServiceTests: XCTestCase {
  func testSearch() throws {

    _ = try requestString(.get, PlaceSearchService.queryBuilder(params: [.query("광화문")]))
      .map(\.1)
      .toBlocking(timeout: 5.0)
      .first()

    let result = try PlaceSearchService.fetch(keyword: "광화문").toBlocking(timeout: 3.0).first()

    print("[📌 Result]", result)
    XCTAssertNotEqual(result, [])
  }
  
  
}
