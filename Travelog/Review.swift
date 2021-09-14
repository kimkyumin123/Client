//
//  Review.swift
//  Review
//
//  Created by 송준권 on 2021/08/27.
//
import ApolloAPI
import ApolloUtils
import Foundation

struct Review {
  var id: Int
  var text: String
  var image: URL
  var placeID: String

  struct Upload: Codable {
    var text: String
    var image: URL
    var placeID: String
  }
}
