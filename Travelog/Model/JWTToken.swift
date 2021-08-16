//
//  Token.swift
//  Travelog
//
//  Created by JK on 2021/08/16.
//

import Foundation

struct JWTToken {

  // MARK: Lifecycle

  init?(value: String) {
    self.value = value
    guard let payload = Self.createPayload(token: value) else {
      return nil
    }
    self.payload = payload
  }

  // MARK: Internal

  struct Payload: Decodable {
    var id: Int
    var issuedAt: Date
    var expiredAt: Date

    enum CodingKeys: String, CodingKey {
      case id
      case issuedAt = "iat"
      case expiredAt = "exp"
    }

    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      id = try container.decode(Int.self, forKey: .id)
      let iat = try container.decode(Int.self, forKey: .issuedAt)
      issuedAt = Date(timeIntervalSince1970: Double(iat))
      let exp = try container.decode(Int.self, forKey: .expiredAt)
      expiredAt = Date(timeIntervalSince1970: Double(exp))
    }
  }

  enum JWTError: Error {
    case invalidPayload
  }

  let value: String
  let payload: Payload

  // MARK: Private

  private static func createPayload(token: String) -> Payload? {
    let payloadString = String(token.split(separator: ".")[1])

    guard
      let payloadData = payloadString.bs64ToData,
      let payload = try? JSONDecoder().decode(Payload.self, from: payloadData) else
    {
      return nil
    }

    return payload
  }
}
