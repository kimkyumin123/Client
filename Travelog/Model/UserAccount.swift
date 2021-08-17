//
//  UserAccount.swift
//  Travelog
//
//  Created by JK on 2021/08/16.
//

import Foundation

struct UserAccount {
  private init() { }

  struct SignUpFields {
    let userName: String
    let bio: String?
    let gender: String?
    let ageRange: String?
    let email: String
    let nickName: String
    let avatar: String?
    let password: String
  }
}
