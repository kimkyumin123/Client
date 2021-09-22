//
//  PostWriteViewModel.swift
//  Travelog
//
//  Created by JK on 2021/09/16.
//

import Foundation
import ReactorKit

// MARK: - PostWriteViewModel

/**
 리뷰 작성 화면
 
 리뷰 작성 버튼
 사진 업로드 버튼
 */

final class PostWriteViewModel: Reactor {

  // MARK: Internal

  enum Action {
    case updateImage(index: Int, image: Data) // 자료형 변경될 수 있음
    case updateText(index: Int, text: String)

    // 순서 변경
    case reorder(from: Int, to: Int)
    case addImage(image: Data)
  }

  enum Mutation {
    // case updateImage(index: Int, image: Data) // 자료형 변경될 수 있음
    // case updateText(index: Int, text: String)
    // case reorderData(from: Int, to: Int)
    case updateData([Review.Upload])
  }

  struct State {
    var data: [Review.Upload] = []
  }

  var initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .reorder(let from, let to):
      var data = currentState.data
      let value = data.remove(at: from)
      data.insert(value, at: to)
      return .just(Mutation.updateData(data))

    case .updateText(let index, let text):
      var data = currentState.data
      data[index].text = text
      return .just(Mutation.updateData(data))

    case .updateImage(let index, let image):
      var data = currentState.data
      data[index].image = image
      return .just(Mutation.updateData(data))

    case .addImage(let image):
      var data = currentState.data
      data.append(Review.Upload(text: "", image: image, placeID: ""))
      return .just(Mutation.updateData(data))
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .updateData(let data):
      newState.data = data
    }
    return newState
  }

  // MARK: Private

  /**
   업로드할 데이터를 `state`에 두었을 때 장점.
   작성 중이던 데이터를 불러오려면 데이터를 받아와야함.
   */
  private var uploadData = [Review.Upload]()
}

// MARK: - Logic

extension PostWriteViewModel {

}
