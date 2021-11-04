//
//  PhotoService.swift
//  Travelog
//
//  Created by JK on 2021/11/04.
//

import Foundation
import RxSwift
import Photos

final class PhotoService {
  init() { }
  static func authRequset() -> Completable {
      
  }
  
  static func data(from asset: PHAsset) -> Observable<Data> {
    return .create { subscriber in
      let manager = PHImageManager.default()
      let id = manager.requestImageDataAndOrientation(for: asset, options: nil) { data, _, _, _ in
        if let data = data {
          subscriber.onNext(data)
        }
      }

      return Disposables.create {
        manager.cancelImageRequest(id)
      }
    }
    .debug()
    .take(2)
    .debounce(.seconds(2), scheduler: ConcurrentDispatchQueueScheduler(qos: .userInitiated))
 }
}
