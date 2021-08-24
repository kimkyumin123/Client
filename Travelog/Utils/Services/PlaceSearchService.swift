//
//  PlaceSearchService.swift
//  Travelog
//
//  Created by JK on 2021/08/23.
//

import Foundation
import RxAlamofire
import RxSwift

// MARK: - PlaceSearchService

final class PlaceSearchService {

  // MARK: Lifecycle

  private init() { }

  // MARK: Internal

  static func fetch(keyword: String, params: [Parameters] = []) -> Observable<[Place.Item]> {
    var queryItems: [ Parameters] = [.query(keyword)]
    queryItems.append(contentsOf: params)

    guard let item = try? queryBuilder(query: queryItems) else {
      return .error(PlaceSearchServiceError.invlaidURL)
    }

    return RxAlamofire
      .requestDecodable(.get, item)
      .map(\.1)
      .flatMap { (_data: Place.APIResponse) -> Observable<[Place.Item]> in
        guard let data = _data.result?.items else {
          return .just([])
        }
        return .just(data)
      }
  }
  static func request(_ url: URLComponents) -> Observable<Place.APIResponse> {
    RxAlamofire.requestDecodable(.get, url)
      .map(\.1)
  }

  static func queryBuilder(params: [Parameters]) throws -> URLComponents {
    guard var components = URLComponents(string: Constraints.locationAPI) else {
      throw PlaceSearchServiceError.invlaidURL
    }

    let _params: [Parameters] = [.request("search"), .type("place"), .key(Constraints.locationAPIKey)]
    components.queryItems?.append(contentsOf: _params.map(\.queryItem))

    params.forEach { components.queryItems?.append($0.queryItem) }

    return components
  }
}

// MARK: - Parameters

extension PlaceSearchService {
  enum Category {
    case touristSpot

    var code: String {
      switch self {
      case .touristSpot:
        return "0603"
      }
    }
  }

  enum Parameters {
    case service(String)
    case version(String)
    case request(String)
    /// API Key
    case key(String)
    case errorFormat(String)
    case size(String)
    case page(String)
    /// 검색 키워드
    case query(String)
    case type(String)
    /// 검색 카테고리
    case cateogry(Category)
    case bbox(String)
    case bboxDouble(Double, Double, Double, Double)
    case crs(String)

    // MARK: Internal

    var queryItem: URLQueryItem {
      switch self {
      case .service(let value):
        return URLQueryItem(name: "service", value: value)
      case .version(let value):
        return URLQueryItem(name: "version", value: value)
      case .request(let value):
        return URLQueryItem(name: "request", value: value)
      case .key(let value):
        return URLQueryItem(name: "key", value: value)
      case .errorFormat(let value):
        return URLQueryItem(name: "errorFormat", value: value)
      case .size(let value):
        return URLQueryItem(name: "size", value: value)
      case .page(let value):
        return URLQueryItem(name: "page", value: value)
      case .query(let value):
        return URLQueryItem(name: "query", value: value)
      case .type(let value):
        return URLQueryItem(name: "type", value: value)
      case .cateogry(let value):
        return URLQueryItem(name: "category", value: value.code)
      case .bbox(let value):
        return URLQueryItem(name: "bbox", value: value)
      case .bboxDouble(let minx, let miny, let maxx, let maxy):
        return URLQueryItem(name: "bbox", value: "\(minx),\(miny),\(maxx),\(maxy)")
      case .crs(let value):
        return URLQueryItem(name: "crs", value: value)
      }
    }
  }
}

// MARK: - PlaceSearchServiceError

enum PlaceSearchServiceError: Error {
  case invlaidURL
  case invalidData
}
