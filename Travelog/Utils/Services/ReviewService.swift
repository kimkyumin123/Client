//
//  ReviewService.swift
//  Travelog
//
//  Created by JK on 2021/09/03.
//

import Apollo
import Foundation
import RxSwift

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
  static func upload(tour: Tour) -> Completable {
    .create { subscriber in

      subscriber(.completed)
      return Disposables.create()
    }
  }

  // TODO: - 타임라인 fetch
  static func fetch(page: Int = 1) -> Observable<[Tour]> {
    .create { subscriber in
      subscriber.onNext([])

      return Disposables.create()
    }
  }

  // TODO: - fetch 보다 상세한 정보 GQL 요청
  static func getTour(id: Int) -> Observable<Tour> {
    .create { _ in

      Disposables.create()
    }
  }

}
