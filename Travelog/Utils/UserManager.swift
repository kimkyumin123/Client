//
//  UserManager.swift
//  Travelog
//
//  Created by JK on 2021/08/11.
//

import Foundation

final class UserManager {
  static func createUser(
    bio: String?,
    userName: String,
    gender: String?,
    ageRange: String?,
    email: String,
    nickName: String,
    avatar: String?,
    password: String)
  {

    Network.shared.apollo.perform(
      mutation: CreateUserMutation(
        bio: bio,
        userName: userName,
        gender: gender,
        ageRange: ageRange,
        email: email,
        nickName: nickName,
        avatar: avatar,
        password: password)) { result in
        switch result {
        case .success(let result):
          print(result.data)
        case .failure(let err):
          print(err.localizedDescription)
        }
    }

  }

  static func createOAuthUser() { }

  static func checkValidate(nickname: String) { }

  static func checkValidate(email: String) { }

  static func updateUser() { }

  static func deleteUser() { }

  static func login() { }

  static func oAuthLogin() { }

  static func logout() {}
}
