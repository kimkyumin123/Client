//
//  UserAccount.swift
//  Travelog
//
//  Created by JK on 2021/08/16.
//

import Foundation

struct UserAccount {

  // MARK: Lifecycle

  private init() { }

  // MARK: Internal

  enum Platform: Int {
    case naver, kakao, apple, service
    case notLoggedIn

    var value: String {
      switch self {
      case .naver:
        return "naver"
      case .kakao:
        return "kakao"
      case .apple:
        return "apple"
      case .service:
        return "service"
      case .notLoggedIn:
        return "nil"
      }
    }
  }

  struct SignUpFields {

    // MARK: Lifecycle

    init(
      userName: String,
      bio: String? = nil,
      gender: String? = nil,
      ageRange: String? = nil,
      email: String,
      nickName: String,
      avatar: String? = nil,
      password: String)
    {
      self.userName = userName
      self.bio = bio
      self.gender = gender
      self.ageRange = ageRange
      self.email = email
      self.nickName = nickName
      self.avatar = avatar
      self.password = password
    }

    // MARK: Internal

    let userName: String
    let bio: String?
    let gender: String?
    let ageRange: String?
    let email: String
    let nickName: String
    let avatar: String?
    let password: String

  }

  struct OAuthSignUpFields {
    let nickName: String
    let avatar: String?
    let bio: String?
//    let email: String
  }

  struct UpdateFields {

    // MARK: Lifecycle

    init(
      nickName: String? = nil,
      bio: String? = nil,
      avatar: String? = nil,
      password: String? = nil,
      gender: String? = nil,
      ageRange: String? = nil)
    {
      self.nickName = nickName
      self.bio = bio
      self.avatar = avatar
      self.password = password
      self.gender = gender
      self.ageRange = ageRange
    }

    // MARK: Internal

    let nickName: String?
    let bio: String?
    let avatar: String?
    let password: String?
    let gender: String?
    let ageRange: String?

  }

  // MARK: - NaverInfoResponse
  /**
   Naver 에서 "https://openapi.naver.com/v1/nid/me" 경로로 요청 시에
   응답으로 오는 구조체입니다.
   */

  struct NaverInfoResponse: Codable {
    let resultcode, message: String
    let response: Response?
  }

  // MARK: - Response

  struct Response: Codable {
    let email, nickname: String?
    let profileImage: String?
    let id: String
    let age, gender, name: String?
    let birthday: String?

    enum CodingKeys: String, CodingKey {
      case email, nickname
      case profileImage = "profile_image"
      case age, gender, id, name, birthday
    }
  }

}
