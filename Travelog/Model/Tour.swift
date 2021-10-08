//
//  Tour.swift
//  Travelog
//
//  Created by JK on 2021/09/07.
//

import Foundation

struct Tour {
  var id: Int
  var writerID: Int
  var createdAt: Date
  var updatedAt: Date

  var reviews: [Review]

  struct Upload {
    var writerID: Int
    var reviews: [Review]
  }
}
