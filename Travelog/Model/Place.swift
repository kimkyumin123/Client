//
//  Place.swift
//  Travelog
//
//  Created by JK on 2021/08/23.
//

import CoreLocation
import Foundation

// MARK: - Place

struct Place {
  typealias Coords = CLLocationCoordinate2D
  // MARK: - APIResponse
  struct APIResponse: Decodable {

    // MARK: Lifecycle

    init(from decoder: Decoder) throws {
      let _container = try decoder.container(keyedBy: CodingKeys.self)
      let container = try _container.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
      service = try container.decode(Service.self, forKey: .service)
      status = try container.decode(String.self, forKey: .status)
      record = try container.decode(Record.self, forKey: .record)
      page = try container.decode(Page.self, forKey: .page)
      result = try? container.decode(Result.self, forKey: .result)
    }

    // MARK: Internal

    enum CodingKeys: String, CodingKey {
      case service, status, record, page, result
      case response
    }

    let service: Service
    let status: String
    let record: Record
    let page: Page
    let result: Result?

  }

  // MARK: - Page
  struct Page: Codable {
    let total, current, size: String
  }

  // MARK: - Record
  struct Record: Codable {
    let total, current: String
  }

  // MARK: - Result
  struct Result: Codable {
    let crs, type: String
    let items: [Item]
  }

  // MARK: - Item
  struct Item: Codable, Equatable {
    let id, title, category: String
    let address: Address
    let point: Point

    static func == (lhs: Place.Item, rhs: Place.Item) -> Bool {
      lhs.id == rhs.id
    }
  }

  // MARK: - Address
  struct Address: Codable, Equatable {
    let road, parcel: String
  }

  // MARK: - Point
  struct Point: Codable {
    let x, y: String
  }

  // MARK: - Service
  struct Service: Codable {
    let name, version, operation, time: String
  }

  var id: Int
  var category: String?
  var address: String
  var point: Coords
}

// MARK: - To Place

extension SearchPlaceQuery.Data.SearchPlace {
  var place: Place {
    Place(id: id, category: category, address: address, point: Place.Coords(latitude: x, longitude: y))
  }
}
