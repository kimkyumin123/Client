//
//  DetailPostViewModel.swift
//  Travelog
//
//  Created by JK on 2021/09/22.
//

import Foundation
import ReactorKit

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

final class DetailPostViewModel: Reactor {
  enum Action {
//    case likeToggle
//    case unlikeToggle
//    case comment(reviewID: Int, text: String)
//    case reloadComment
//    case reloadPost
  }

  enum Mutation {
//      case updatePosts
//      case updatePostsCount
//      case updateLikeCount(Int)
//      case updateUnlikeCount(Int)
  }

  struct State {
    var reviews: [Review] = []
    var comments: [Review.Comment] = []
  }

  var initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {

  }

  func reduce(state: State, mutation: Mutation) -> State {

  }
}

// MARK: - Logic

extension DetailPostViewModel {
  private func likeToggle() -> Observable<Bool> {
    .create { _ in
      // TODO: - 카운트 업데이트 이후에 수 추가

      Disposables.create()
    }
  }
}
