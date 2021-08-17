//
//  UserManagementInterceptor.swift
//  Travelog
//
//  Created by JK on 2021/08/16.
//

import Apollo
import ApolloAPI
import Foundation
import os.log

// MARK: - NetworkInterceptorProvider

struct NetworkInterceptorProvider: InterceptorProvider {

  // MARK: Lifecycle

  init(store: ApolloStore, client: URLSessionClient) {
    self.store = store
    self.client = client
  }

  // MARK: Internal

  func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
    [
      MaxRetryInterceptor(),
      UserManagementInterceptor(),
      NetworkFetchInterceptor(client: client),
      AutomaticPersistedQueryInterceptor(),
      ResponseCodeInterceptor(),
      JSONResponseParsingInterceptor(cacheKeyForObject: store.cacheKeyForObject),
      CacheWriteInterceptor(store: store),
      CacheReadInterceptor(store: store),
    ]
  }

  // MARK: Private

  // These properties will remain the same throughout the life of the `InterceptorProvider`, even though they
  // will be handed to different interceptors.
  private let store: ApolloStore
  private let client: URLSessionClient

}

// MARK: - UserManagementInterceptor

final class UserManagementInterceptor: ApolloInterceptor {

  // MARK: Internal

  func interceptAsync<Operation>(
    chain: RequestChain,
    request: HTTPRequest<Operation>,
    response: HTTPResponse<Operation>?,
    completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) where Operation: GraphQLOperation
  {

    guard UserDefaults.isLoggedIn == true, let token = UserService.token else {
      chain.proceedAsync(request: request, response: response, completion: completion)
      return
    }

    // TODO: 토큰 만료시, 사용자 토큰 갱신
    //  if token.isExpired {
    //
    //  }

    addTokenAndProceed(token, to: request, chain: chain, response: response, completion: completion)
  }

  // MARK: Private

  private func addTokenAndProceed<Operation: GraphQLOperation> (
    _ token: JWTToken,
    to request: HTTPRequest<Operation>,
    chain: RequestChain,
    response: HTTPResponse<Operation>?,
    completion: @escaping(Result<GraphQLResult<Operation.Data>, Error>) -> Void)
  {
    os_log(.debug, log: .apollo, "🚀 Add Authorization Header: %s", token.value)
    request.addHeader(name: "Authorization", value: "Bearer \(token.value)")
    chain.proceedAsync(request: request, response: response, completion: completion)
  }
}
