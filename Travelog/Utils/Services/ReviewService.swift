//
//  ReviewService.swift
//  Travelog
//
//  Created by JK on 2021/09/03.
//

import Apollo
import Foundation
import os.log
import Photos
import RxSwift

// MARK: - ReviewService

final class ReviewService {

  // MARK: Lifecycle

  private init() { }

  // MARK: Internal

  // TODO: - 업로드 기능 구현
  static func upload(image: Data) -> Completable {
    .create { subscriber in

      subscriber(.completed)
      return Disposables.create()
    }
  }

  // TODO: - 투어 업로드
  static func upload(post: Post) -> Completable {
    .create { subscriber in

      subscriber(.completed)
      return Disposables.create()
    }
  }

  // TODO: - 타임라인 fetch
  static func fetch(page: Int = 1) -> Observable<[Post]> {
    .create { subscriber in
      subscriber.onNext([])

      return Disposables.create()
    }
  }

  // TODO: - fetch 보다 상세한 정보 GQL 요청
  static func getTour(id: Int) -> Observable<Post> {
    .create { _ in

      Disposables.create()
    }
  }

  // MARK: - area 는 검색 조건에 없음. lastID로 마지막 검색 결과를 표시했다.

  static func search(keyword: String, category: String?, area: String?, lastID: Int?) -> Observable<[Review]> {
    .create { subscriber in
      Network.shared.apollo.fetch(query: SearchReviewQuery(title: keyword, category: category, lastID: lastID)) {
        guard let data = (try? $0.get())?.data?.searchReview else {
          // TODO: - error code 작성
          return
        }

        subscriber.onNext(data.map { $0.review })
        subscriber.onCompleted()
      }

      return Disposables.create()
    }
  }

  static func likeReview(id: Int) -> Completable {
    .create { subscriber in
      let query = Network.shared.apollo.perform(mutation: LikeReviewToggleMutation(id: id), publishResultToStore: false) {
        guard let _data = try? $0.get().data?.recommendEvent else {
          subscriber(.error(ReviewServiceError.requestFailed))
          return
        }

        if _data.ok {
          subscriber(.completed)
        }

        // TODO: - 추가적인 에러처리
      }

      return Disposables.create { query.cancel() }
    }
  }

  static func unlikeReviewToggle(id: Int) -> Completable {

    .create { subscriber in
      let query = Network.shared.apollo.perform(mutation: UnlikeReviewToggleMutation(id: id), publishResultToStore: false ) {
        guard let _data = try? $0.get().data?.recommendEvent else {
          subscriber(.error(ReviewServiceError.requestFailed))
          return
        }

        if _data.ok {
          subscriber(.completed)
        }

      }
      return Disposables.create { query.cancel() }
    }
  }

  static func updateLikeStatus(id: Int) -> Observable<(likeCount: Int, unlikeCount: Int, isLike: Bool, isUnlike: Bool)> {
    .create { subscriber in
      let query = Network.shared.apollo.fetch(query: ReviewLikeStatusQuery(id: id)) {
        guard
          let _data = try? $0.get().data?.searchReview,
          let review = _data.first else
        {
          subscriber.onError(ReviewServiceError.requestFailed)
          return
        }

        subscriber.onNext((likeCount: review.getLikes, unlikeCount: review.getUnLikes, isLike: review.isLike, isUnlike: review.isUnLike))
        subscriber.onCompleted()

      }
      return Disposables.create { query.cancel() }
    }
  }

  static func post(postID: Int) -> Observable<Post> {
    Network.shared.apollo.rx.fetch(query: PostQuery(id: postID))
      .compactMap { $0.searchReviewRoom?.post }
      .asObservable()
  }

  static func write(post: [ReviewInput], images: [PHAsset]) -> Completable {
    os_log(.debug, log: .review, "write(post:images)")
    var post = post

    return Observable.zip(
      images.map { PhotoService.data(from: $0) }
    ) { $0.enumerated() }
      .map { data -> [GraphQLFile] in
        data.map { idx, data -> GraphQLFile in
          let name = String(idx)
          let resource = PHAssetResource.assetResources(for: images[idx])
          post[idx].upload = "variables.files." + String((resource.first?.originalFilename ?? name).split(separator: ".")[0])
          return GraphQLFile(fieldName: "upload", originalName: resource.first?.originalFilename ?? name, mimeType: "image/jpeg", data: data)
        }
      }
      .flatMap { files -> Observable<Never> in
        .create { subscriber in
          print(post)
          let request = Network.shared.apollo.upload(operation: CreateReviewMutation(reviews: post), files: files) {

            switch $0 {
            case .success(let success):
              print("⭐️", success)
            case .failure(let error):
              print("⭐️", error.localizedDescription)
            }

            guard let data = try? $0.get().data?.createReview else {
              subscriber.onError(ReviewServiceError.requestFailed)
              return
            }

            if data.ok {
              subscriber.onCompleted()
            }

          }

          return Disposables.create { request.cancel() }
        }
      }
      .asCompletable()
      .debug()

  }

}

// MARK: - ReviewServiceError

enum ReviewServiceError: Error {
  case requestFailed
}
