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

    _ = try requestString(.get, APIPlaceSearchService.queryBuilder(params: [.query("광화문")]))
      .map(\.1)
      .toBlocking(timeout: 5.0)
      .first()

    let result = try APIPlaceSearchService.fetch(keyword: "광화문").toBlocking(timeout: 3.0).first()

    print("[📌 Result]", result)
    XCTAssertNotEqual(result, [])
  }

  func test_newtest() throws {
    let expect = expectation(description: "hi")

    APIPlaceSearchService.fetchString(keyword: "광화문") { str in
      print(str)
      expect.fulfill()
    }

    wait(for: [expect], timeout: 10.0)
  }

}
