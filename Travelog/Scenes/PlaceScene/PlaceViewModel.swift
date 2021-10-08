//
//  PlaceViewModel.swift
//  Travelog
//
//  Created by JK on 2021/10/08.
//

import Foundation
import ReactorKit
import RxFlow
import RxRelay

// MARK: - PlaceViewModel

final class PlaceViewModel: Reactor, Stepper {

  // MARK: Lifecycle

  init(id: Int) {
    self.id = id
  }

  // MARK: Internal

  enum Action {
    // case loadPlaceInfo
    // case loadRelatedReviews
  }

  enum Mutation {

  }

  struct State {

  }

  let id: Int

  var steps = PublishRelay<Step>()

  var initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {

  }

  func reduce(state: State, mutation: Mutation) -> State {

  }
}

// MARK: - Logic

extension PlaceViewModel {

}
