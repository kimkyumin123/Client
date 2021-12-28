//
//  PostWriteViewModel.swift
//  Travelog
//
//  Created by JK on 2021/09/16.
//

import Foundation
import Photos.PHAsset
import ReactorKit
import UIKit.UIImage

// MARK: - PostWriteViewModel

/**
 리뷰 작성 화면


 글을 쓰기 위한 textview 가 존재한다.
 사진을 보여주는 uiimageview 가 존재한다.

 스크롤인 화면을 보여줄 도트가 필요

 해당 씬 내부에 PostWriteViewModel 이 포함되어야 할 듯.
 리뷰 작성 버튼
 사진 업로드 버튼

 글과 이미지는 한쌍이다. 이미지와 data 는 한쌍이다. 두개 모두 쌍으로 묶어 전달한다. 쌍으로 갖고 있다가 나중에 전달.

 사진 업로드 순서 .
 먼저 사진을 선택하는 버튼을 클릭 ->
 사진 선택 (라이브러리 사용하는 것이 좋을 듯.) ->
 받아온 사진을 배열에 업데이트. 이미지뷰 또한 업데이트.  // 이것이 뷰모델에서 진행해야할 작업.
 // UIImage 는 뷰모델에서 업데이트를 안해도 될 듯.
 */

final class PostWriteViewModel: Reactor {

  enum Action {
    case updateImage(index: Int, image: PHAsset)
    case updateText(index: Int, text: String)
    case updatePlace(index: Int, place: Place)
    case reorder(from: Int, to: Int)
    case addNewPage
//    case submit
  }

  enum Mutation {
    case updateImage(index: Int, image: Data)
    case addNewPage
    case updateText(index: Int, text: String)
    case reorderData(from: Int, to: Int)
    case updatePlace(index: Int, place: Place)
  }

  struct State {
    var data: [Review.Upload] = []
  }

  var initialState = State()

  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .reorder(let from, let to):
      return .just(.reorderData(from: from, to: to))

    case .updateText(let index, let text):
      return .just(.updateText(index: index, text: text))

    case .updateImage(let index, let asset):
      return PhotoService.data(from: asset)
        .map { Mutation.updateImage(index: index, image: $0) }

    case .addNewPage:
      return .just(.addNewPage)

    case .updatePlace(let index, let place):
      return .just(.updatePlace(index: index, place: place))
    }
  }

  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state

    switch mutation {
    case .addNewPage:
      newState.data.append(Review.Upload.init())

    case .updateImage(index: let index, image: let image):
      newState.data[index].image = image

    case .updateText(index: let index, text: let text):
      newState.data[index].text = text

    case .reorderData(from: let from, to: let to):
      let temp = newState.data[from]
      newState.data.insert(temp, at: to)
      newState.data.remove(at: from)

    case .updatePlace(index: let index, place: let place):
      newState.data[index].place = place
    }
    return newState
  }
}

// MARK: - Logic

extension PostWriteViewModel {

}
