//
//  Network.swift
//  Travelog
//
//  Created by JK on 2021/08/12.
//

import Apollo
import Foundation

final class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: Constraints.gqlAddr)!)
}
