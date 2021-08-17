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

  enum Platform: String {
    case naver, kakao, apple, service
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
}
