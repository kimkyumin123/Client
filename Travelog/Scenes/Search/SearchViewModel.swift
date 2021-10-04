//
//  SearchViewModel.swift
//  Travelog
//
//  Created by JK on 2021/09/29.
//

import Foundation
import ReactorKit

// MARK: - SearchViewModel

final class SearchViewModel: Reactor {
  enum Action {
    case searchPlace(keyword: String, category: String?, area: String?, lastID: Int?)
    case searchReview(keyword: String, category: String?, area: String?, lastID: Int?)
  }

  enum Mutation {
    case appendReviews([Review])
    case appendPlaces([Place])
  }

  struct State {
    var results: SearchResult = .places([])
  }

  enum SearchResult {
    case places([Place])
    case reviews([Review])
  }

  var initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {

    case .searchPlace(keyword: let keyword, category: let category, area: let area, lastID: let id):
      return search(place: keyword, category: category, area: area, lastID: id)
        .map { Mutation.appendPlaces($0) }

    case .searchReview(keyword: let keyword, category: let category, area: let area, lastID: let id):
      return search(review: keyword, category: category, area: area, lastID: id)
        .map { Mutation.appendReviews($0) }

    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .appendReviews(let reviews):
      switch newState.results {
      case .places:
        newState.results = .reviews(reviews)
      case .reviews(let prevReviews):
        newState.results = .reviews(prevReviews + reviews)
      }

    case .appendPlaces(let places):
      switch newState.results {
      case .places(let prevPlaces):
        newState.results = .places(prevPlaces + places)
      case .reviews:
        newState.results = .places(places)
      }
    }

    return newState
  }
}

// MARK: - Logic

extension SearchViewModel {
  private func search(place: String, category: String?, area: String?, lastID: Int?) -> Observable<[Place]> {
    PlaceService.search(keyword: place, category: category, lastID: lastID)
  }

  private func search(review: String, category: String?, area: String?, lastID: Int?) -> Observable<[Review]> {
    ReviewService.search(keyword: review, category: category, area: area, lastID: lastID)
  }
}
