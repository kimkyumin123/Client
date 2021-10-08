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

// MARK: - Review

struct Review: Equatable {
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

  struct Comment: Codable, Equatable {
    var id: Int
    var reviewID: Int?
    var createdAt: String?
    var updatedAt: String?
    var payload: String?
    var likeCount: Int
    var unLikeCount: Int
  }

  var id: Int
  var title: String?
  var text: String?
  var image: String?
  var placeID: Int?
  var comments: [Review.Comment]
}

extension SearchReviewQuery.Data.SearchReview {
  var review: Review {
    Review(
      id: id,
      title: title,
      text: content,
      image: upload,
      placeID: placeId,
      comments: comments?.compactMap({ $0?.comment }) ?? [])
  }
}

// MARK: - 앱 내부에서 사용하는 구조체로 변경

extension SearchReviewQuery.Data.SearchReview.Comment {
  var comment: Review.Comment {
    // TODO: - Like / Unlike Count 필요
    // TODO: -  혹시 reviewID, createdAt, updatedAt nullable 할 이유가 있는지 확인
    Review.Comment(id: id, reviewID: reviewId, createdAt: createdAt, updatedAt: updatedAt, payload: payload, likeCount: 0, unLikeCount: 0)
  }
}
