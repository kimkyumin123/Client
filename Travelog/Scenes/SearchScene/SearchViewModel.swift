//
//  SearchViewModel.swift
//  Travelog
//
//  Created by JK on 2021/09/29.
//

import Foundation
import ReactorKit
import RxFlow
import RxRelay

// MARK: - SearchViewModel

final class SearchViewModel: Reactor, Stepper {

  enum Action {
    case setSegment(CurrentSegment)
    case setKeyword(String)
    case setCategory(String)
    case setArea(String)
    case loadNextPage

    case searchPlace
    case searchReview
  }

  enum Mutation {
    case updateSegment(CurrentSegment)
    case updateCategory(String)
    case updateArea(String)
    case updateKeyword(String)

    case updateReviews(value: [Review], isAppended: Bool)
    case updatePlaces(value: [Place], isAppended: Bool)
  }

  struct State {
    var keyword: String = ""
    var category: String? = nil
    var area: String? = nil

    var places: [Place] = []
    var reviews: [Review] = []
    var segment: CurrentSegment = .place
  }

  enum SearchResult: Equatable {
    case places([Place])
    case reviews([Review])
  }

  enum CurrentSegment: String {
    case place = "Place"
    case review = "Review"
  }

  var steps = PublishRelay<Step>()
  var initialState = State()
  var lastID: Int? = nil

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .setSegment(let segment):
      return .concat([
        .just(.updateSegment(segment)),
        search(isLoadNextPage: false),
      ])

    case .setCategory(let category):
      steps.accept(AppSteps.categoryIsRequired)
      return .empty()
//      return .concat([
//        .just(.updateCategory(category)),
//        search(isLoadNextPage: false),
//      ])

    case .setArea(let area):
      return .concat([
        .just(.updateArea(area)),
        search(isLoadNextPage: false),
      ])

    case .setKeyword(let keyword):
      return .concat([
        .just(.updateKeyword(keyword)),
        search(isLoadNextPage: false),
      ])

    case .searchPlace:
      return .concat([
        .just(.updateSegment(.place)),
        search(isLoadNextPage: false),
      ])

    case .searchReview:
      return .concat([
        .just(.updateSegment(.review)),
        search(isLoadNextPage: false),
      ])

    case .loadNextPage:
      return search(isLoadNextPage: true)
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .updateSegment(let segment):
      newState.segment = segment
    case .updateArea(let area):
      newState.area = area
    case .updateCategory(let cateogry):
      newState.category = cateogry
    case .updateKeyword(let keyword):
      newState.keyword = keyword

    case .updatePlaces(value: let places, isAppended: let boolean):
      newState.places = boolean ? state.places + places : places
    case .updateReviews(value: let reviews, isAppended: let boolean):
      newState.reviews = boolean ? state.reviews + reviews : reviews
    }

    return newState
  }
}

// MARK: - Logic

extension SearchViewModel {
  private func search(isLoadNextPage: Bool) -> Observable<Mutation> {
    if currentState.keyword == "" { return .empty() }
    switch currentState.segment {
    case .place:
      return search(place: currentState.keyword, category: currentState.category, area: currentState.area, lastID: lastID)
        .map {
          self.lastID = $0.last?.id
          return $0
        }
        .map { Mutation.updatePlaces(value: $0, isAppended: isLoadNextPage) }

    case .review:
      return search(review: currentState.keyword, category: currentState.category, area: currentState.area, lastID: lastID)
        .map {
          self.lastID = $0.last?.id
          return $0
        }
        .map { Mutation.updateReviews(value: $0, isAppended: isLoadNextPage) }
    }
  }

  private func search(place: String, category: String?, area: String?, lastID: Int?) -> Observable<[Place]> {
    PlaceService.search(keyword: place, category: category, lastID: lastID)
  }

  private func search(review: String, category: String?, area: String?, lastID: Int?) -> Observable<[Review]> {
    ReviewService.search(keyword: review, category: category, area: area, lastID: lastID)
  }
}
