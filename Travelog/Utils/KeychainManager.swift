//
//  KeychainManager.swift
//  Travelog
//
//  Created by JK on 2021/08/11.
//

import CryptoKit
import Foundation
import os.log

// MARK: - KeychainManager

final class KeychainManager {

  // MARK: Lifecycle

  private init() { }

  // MARK: Internal

  enum AccountKey {
    case refreshToken
    case accessToken
    case custom(String)

    var value: String {
      switch self {
      case .refreshToken: return "REFRESH_TOKNE"
      case .accessToken: return "ACCESS_TOKEN"
      case .custom(let str): return str
      }
    }
  }

  static func write(key: AccountKey, value: String) throws {
    guard let data = value.data(using: .utf8) else {
      throw KeyChainError.invalidString
    }

    let query: NSDictionary = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: key.value,
      kSecAttrService: serviceIdentifier,
      kSecValueData: data,
    ]

    let status: OSStatus = SecItemAdd(query as CFDictionary, nil)
    os_log(.debug, log: .keychain, "Write item")

    if status != errSecSuccess {
      if status == errSecDuplicateItem {
        try update(key: key, value: value)
      } else {
        let str = SecCopyErrorMessageString(status, nil)
        os_log(.debug, log: .keychain, "Save item error : %s", str as! CVarArg)
      }
    }
  }

  static func read(key: AccountKey) throws -> String {
    let query: NSDictionary = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: key.value,
      kSecAttrService: serviceIdentifier,
      kSecReturnData: true,
    ]

    var item: CFTypeRef?
    let status = SecItemCopyMatching(query, &item)

    if status == errSecSuccess {
      guard let data = item as? Data else { throw KeyChainError.itemNotFound }
      guard let value = String(data: data, encoding: .utf8) else { throw KeyChainError.decodeError }
      return value
    } else {
      let str = SecCopyErrorMessageString(status, nil)
      os_log(.fault, log: .keychain, "Load item error : %s", str as! CVarArg)
      throw KeyChainError.itemNotFound
    }
  }

  static func update(key: AccountKey, value: String) throws {
    guard let data = value.data(using: .utf8) else {
      throw KeyChainError.invalidString
    }

    let query: NSDictionary = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: key.value,
      kSecAttrService: serviceIdentifier,
    ]

    let attr: NSDictionary = [kSecValueData: data]
    let status = SecItemUpdate(query as CFDictionary, attr as CFDictionary)
    os_log(.debug, log: .keychain, "Update item")

    guard status != errSecItemNotFound else { throw KeyChainError.itemNotFound }
    guard status == errSecSuccess else { throw KeyChainError.cannotSave }
  }

  static func delete(key: AccountKey) throws {
    let query: NSDictionary = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: key.value,
      kSecAttrService: serviceIdentifier,
    ]

    let status = SecItemDelete(query)
    if status != errSecSuccess {
      throw KeyChainError.cannotDelete
    }
  }

  // MARK: Private

  static private let serviceIdentifier = Bundle.main.bundleIdentifier!

}

// MARK: - KeyChainError

enum KeyChainError: Error {
  case invalidString
  case cannotSave
  case attrNotFound
  case itemNotFound
  case decodeError
  case cannotDelete
}
