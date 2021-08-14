//
//  Network.swift
//  Travelog
//
//  Created by JK on 2021/08/12.
//

import Apollo
import Foundation

final class Network {
  static let apollo = ApolloClient(url: URL(string: Constraints.gqlAddr)!)
}
