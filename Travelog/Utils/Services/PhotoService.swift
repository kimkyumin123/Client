//
//  PhotoService.swift
//  Travelog
//
//  Created by JK on 2021/11/04.
//

import Foundation
import Photos
import RxSwift

// MARK: - PhotoService

final class PhotoService {

  // MARK: Lifecycle

  init() { }

  // MARK: Internal

  /// 사진 이미지 권한을 요청합니다.
  static func requstAuthorization() -> Completable {
    .create { subscriber in
      // - iOS 14+ 이상일 경우 일부 이미지만 허용할 수 있음.
      if #available(iOS 14, *) {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
          // 일부 허용 / 전체 허용 모두 허용해줌.
          if status == .authorized || status == .limited {
            subscriber(.completed)
          } else {
            subscriber(.error(PhotoServiceError.unauthorized))
          }
        }
      } else {
        PHPhotoLibrary.requestAuthorization { status in
          if status == .authorized {
            subscriber(.completed)
          } else {
            subscriber(.error(PhotoServiceError.unauthorized))
          }
        }
      }

      return Disposables.create()
    }
  }

  static func data(from asset: PHAsset) -> Observable<Data> {
    requstAuthorization()
      .andThen(Observable.create { subscriber in
        let manager = PHImageManager.default()
        let id = manager.requestImageDataAndOrientation(for: asset, options: nil) { data, _, _, _ in
          if let data = data {
            subscriber.onNext(data)
          }
        }

        return Disposables.create {
          manager.cancelImageRequest(id)
        }
      })
      .debug()
      .take(2)
      .debounce(.seconds(2), scheduler: ConcurrentDispatchQueueScheduler(qos: .userInitiated))
  }
}

// MARK: - PhotoServiceError

enum PhotoServiceError: Error {
  case unauthorized
  case limited
}
