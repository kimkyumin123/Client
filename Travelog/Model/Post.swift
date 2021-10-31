//
//  Tour.swift
//  Travelog
//
//  Created by JK on 2021/09/07.
//

import Apollo
import Foundation

// MARK: - Post

struct Post {
  var id: Int
  var createdAt: String
  var updatedAt: String

  var reviews: [Review]

  struct Upload {
    var writerID: Int
    var reviews: [Review]
  }
}

extension PostQuery.Data.SearchReviewRoom {
  var post: Post {
    Post(id: id, createdAt: createdAt, updatedAt: updatedAt , reviews: review.compactMap { $0?.review } )
  }

}
