//
//  DetailPostViewModel.swift
//  Travelog
//
//  Created by JK on 2021/09/22.
//

import Foundation
import ReactorKit
import RxFlow
import RxRelay

// MARK: - DetailPostViewModel

/** TODO:
 - 지도 정보 표시
 - 게시글 스크롤 뷰로 페이징 처리해서 표시
 - 이미지 / 텍스트 표시
 - load comments
 - 좋아요 카운트
 - 현재 게시글 좋아요 상태

 - 좋아요 업 다운 액션 / 카운트
 - 댓글 좋아요 업다운.
 */

final class DetailPostViewModel: Reactor, Stepper {

  // MARK: Lifecycle

  init(postID: Int) {
    self.postID = postID
  }

  // MARK: Internal

  enum Action {
    case likeToggle(reviewID: Int)
    case unlikeToggle(reviewID: Int)
    case reloadPost
    //    case comment(reviewID: Int, text: String)
    //    case reloadComment
  }

  enum Mutation {
    case updateReviews([Review])
    case updateLikeStatus(reviewID: Int, likeCount: Int, unlikeCount: Int, isLike: Bool, isUnlike: Bool)
  }

  struct State {
    var reviews: [Review] = []
    var comments: [Review.Comment] = []
  }

  var steps = PublishRelay<Step>()
  var initialState = State()
  let postID: Int

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .likeToggle(let id):
      return ReviewService.likeReview(id: id)
        .andThen(
          ReviewService.updateLikeStatus(id: id)
            .map { Mutation.updateLikeStatus(
              reviewID: id,
              likeCount: $0.likeCount,
              unlikeCount: $0.unlikeCount,
              isLike: $0.isLike,
              isUnlike: $0.isUnlike)
            }
        )

    case .unlikeToggle(let id):
      return ReviewService.unlikeReviewToggle(id: id)
        .andThen(
          ReviewService.updateLikeStatus(id: id)
            .map { Mutation.updateLikeStatus(
              reviewID: id,
              likeCount: $0.likeCount,
              unlikeCount: $0.unlikeCount,
              isLike: $0.isLike,
              isUnlike: $0.isUnlike)
            }
        )

    case .reloadPost:
      return ReviewService.post(postID: postID)
        .map { Mutation.updateReviews($0.reviews) }
    }

  }

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .updateLikeStatus(let id, let likeCount, let unlikeCount, let isLike, let isUnlike):
      if let index = newState.reviews.firstIndex(where: { $0.id == id }) {
        newState.reviews[index].likesCount = likeCount
        newState.reviews[index].unlikeCount = unlikeCount
        newState.reviews[index].isLike = isLike
        newState.reviews[index].isUnlike = isUnlike
      }
    case .updateReviews(let reviews):
      newState.reviews = reviews
    }
    return newState
  }
}

// MARK: - Logic

extension DetailPostViewModel {
  private func likeToggle(reviewID: Int) -> Observable<Never> {
    ReviewService.likeReview(id: reviewID)
      .asObservable()
  }

  private func unlikeToggle(reviewID: Int) -> Observable<Never> {
    ReviewService.unlikeReviewToggle(id: reviewID)
      .asObservable()
  }
}
