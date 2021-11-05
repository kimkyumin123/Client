//
//  PlaceService.swift
//  Travelog
//
//  Created by JK on 2021/10/01.
//

import Foundation
import RxSwift

final class PlaceService {

  // MARK: Lifecycle

  private init() { }

  // MARK: Internal

  static func search(keyword: String, category: String?, lastID: Int?) -> Observable<[Place]> {
    .create { subscriber in

      Network.shared.apollo.fetch(query: SearchPlaceQuery(title: keyword, category: category, lastID: lastID)) {
        guard let _data = try? $0.get(), let data = _data.data?.searchPlace else {
          // TODO: - 에러 코드 정의 필요
          // subscriber.onError()
          return
        }

        let value = data.map { $0.place }

        subscriber.onNext(value)
        subscriber.onCompleted()
      }

      return Disposables.create()
    }
  }
}
