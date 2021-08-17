//
//  UserDefaults+Extension.swift
//  UserDefault
//
//  Created by JK on 2021/08/16.
//

import Foundation

extension UserDefaults {

  /// 사용자 로그인 정보
  @UserDefault(key: "IsLoggedIn", defaultValue: false)
  static var isLoggedIn: Bool

  /// 사용자 아이디
  @UserDefault(key: "UserID", defaultValue: "")
  static var userID: String

  @UserDefault(key: "AccountPlatform", defaultValue: nil)
  static var loginPlatform: UserAccount.Platform?
}

// MARK: - UserDefault

@propertyWrapper
struct UserDefault<Value> {
  let key: String
  let defaultValue: Value
  var container: UserDefaults = .standard

  var wrappedValue: Value {
    get {
      container.object(forKey: key) as? Value ?? defaultValue
    }
    set {
      container.set(newValue, forKey: key)
    }
  }

}
