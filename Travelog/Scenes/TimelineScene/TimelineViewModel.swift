//
//  TimelineViewModel.swift
//  Travelog
//
//  Created by JK on 2021/07/24.
//

import Foundation
import ReactorKit
import RxFlow
import RxRelay

// MARK: - TimelineViewModel

final class TimelineViewModel: Stepper, Reactor {
  enum Action {
    // case isWritePostButtonTapped
//     case reloadTimeline
    case loadNextPage
  }

  enum Mutation {
    case updateLoading(Bool)
    case appendPosts([Review])
  }

  struct State {
    var isLoading = false
    var posts: [Review] = []
  }

  var currentPage = 0
  var initialState = State()
  var steps = PublishRelay<Step>()

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .appendPosts(let posts):
      newState.posts.append(contentsOf: posts)
    case .updateLoading(let loading):
      newState.isLoading = loading
    }
    return newState
  }

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .loadNextPage:
      currentPage += 1
      return Observable.concat([
        .just(Mutation.updateLoading(true)),
        fetch(page: currentPage)
          .map { Mutation.appendPosts($0) },
        .just(Mutation.updateLoading(false)),
      ])
    }
  }

}

// MARK: - Logic

extension TimelineViewModel {
  func fetch(page: Int = 1) -> Observable<[Review]> {
    .create { _ in
      // TODO: - Review 를 가져오는 GQL 쿼리
      // subscriber.onNext()

      Disposables.create()
    }
  }
}
