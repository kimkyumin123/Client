//
//  Review.swift
//  Review
//
//  Created by 송준권 on 2021/08/27.
//

import ApolloAPI
import ApolloUtils
import Foundation
import UIKit.UIImage

struct Review: Equatable {
  var id: Int
  var text: String
  var image: URL
  var placeID: String

  struct Upload: Codable, Equatable {
    var text: String
    var image: Data
    var placeID: String
  }

  struct Form: Equatable {
    var text: String?
    var image: UIImage?
    var placeID: String?
    var placeName: String?
  }
}
