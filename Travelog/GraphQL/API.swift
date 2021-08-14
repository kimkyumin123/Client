// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

// MARK: - AuthUserLoginMutation

public final class AuthUserLoginMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(email: String) {
    self.email = email
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(authUserLogin: AuthUserLogin? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "authUserLogin": authUserLogin.flatMap { (value: AuthUserLogin) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct AuthUserLogin: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(ok: Bool? = nil, error: String? = nil, token: Token? = nil) {
        self.init(unsafeResultMap: ["__typename": "loginResponse", "ok": ok, "error": error, "token": token.flatMap { (value: Token) -> ResultMap in value.resultMap }])
      }

      // MARK: Public

      public struct Token: GraphQLSelectionSet {

        // MARK: Lifecycle

        public init(unsafeResultMap: ResultMap) {
          resultMap = unsafeResultMap
        }

        public init(accessToken: String, refreshToken: String) {
          self.init(unsafeResultMap: ["__typename": "Token", "accessToken": accessToken, "refreshToken": refreshToken])
        }

        // MARK: Public

        public static let possibleTypes: [String] = ["Token"]

        public static var selections: [GraphQLSelection] {
          [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("accessToken", type: .nonNull(.scalar(String.self))),
            GraphQLField("refreshToken", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public var __typename: String {
          get {
            resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var accessToken: String {
          get {
            resultMap["accessToken"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "accessToken")
          }
        }

        public var refreshToken: String {
          get {
            resultMap["refreshToken"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "refreshToken")
          }
        }
      }

      public static let possibleTypes: [String] = ["loginResponse"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .scalar(Bool.self)),
          GraphQLField("error", type: .scalar(String.self)),
          GraphQLField("token", type: .object(Token.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public var __typename: String {
        get {
          resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool? {
        get {
          resultMap["ok"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: String? {
        get {
          resultMap["error"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public var token: Token? {
        get {
          (resultMap["token"] as? ResultMap).flatMap { Token(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "token")
        }
      }

    }

    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("authUserLogin", arguments: ["email": GraphQLVariable("email")], type: .object(AuthUserLogin.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var authUserLogin: AuthUserLogin? {
      get {
        (resultMap["authUserLogin"] as? ResultMap).flatMap { AuthUserLogin(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "authUserLogin")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation authUserLogin($email: String!) {
      authUserLogin(email: $email) {
        __typename
        ok
        error
        token {
          __typename
          accessToken
          refreshToken
        }
      }
    }
    """

  public let operationName: String = "authUserLogin"

  public let operationIdentifier: String? = "b3dec90b3c94b76fa67e7570fbe25875e6ed744f70e5303de270a0ee8e535902"

  public var email: String

  public var variables: GraphQLMap? {
    ["email": email]
  }

}

// MARK: - AuthVaildationMutation

public final class AuthVaildationMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init() {
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(authVaildation: AuthVaildation? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "authVaildation": authVaildation.flatMap { (value: AuthVaildation) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct AuthVaildation: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: String? = nil, profileImageUrl: String? = nil, nickname: String? = nil, gender: String? = nil, ageRange: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "authResponse", "ok": ok, "error": error, "profile_image_url": profileImageUrl, "nickname": nickname, "gender": gender, "age_range": ageRange])
      }

      // MARK: Public

      public static let possibleTypes: [String] = ["authResponse"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(String.self)),
          GraphQLField("profile_image_url", type: .scalar(String.self)),
          GraphQLField("nickname", type: .scalar(String.self)),
          GraphQLField("gender", type: .scalar(String.self)),
          GraphQLField("age_range", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public var __typename: String {
        get {
          resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: String? {
        get {
          resultMap["error"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public var profileImageUrl: String? {
        get {
          resultMap["profile_image_url"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profile_image_url")
        }
      }

      public var nickname: String? {
        get {
          resultMap["nickname"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "nickname")
        }
      }

      public var gender: String? {
        get {
          resultMap["gender"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var ageRange: String? {
        get {
          resultMap["age_range"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "age_range")
        }
      }
    }

    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("authVaildation", type: .object(AuthVaildation.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var authVaildation: AuthVaildation? {
      get {
        (resultMap["authVaildation"] as? ResultMap).flatMap { AuthVaildation(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "authVaildation")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation authVaildation {
      authVaildation {
        __typename
        ok
        error
        profile_image_url
        nickname
        gender
        age_range
      }
    }
    """

  public let operationName: String = "authVaildation"

  public let operationIdentifier: String? = "614a2148de949726d32d46e5af1a452ae182c71ddc44163f99c8d03b4429286c"

}

// MARK: - CreateAuthUserMutation

public final class CreateAuthUserMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(nickName: String, avatar: String? = nil, bio: String? = nil, platformType: String, email: String) {
    self.nickName = nickName
    self.avatar = avatar
    self.bio = bio
    self.platformType = platformType
    self.email = email
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(createAuthUser: CreateAuthUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createAuthUser": createAuthUser.flatMap { (value: CreateAuthUser) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct CreateAuthUser: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "MutationResponse", "ok": ok, "error": error])
      }

      // MARK: Public

      public static let possibleTypes: [String] = ["MutationResponse"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public var __typename: String {
        get {
          resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }

    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("createAuthUser", arguments: ["nickName": GraphQLVariable("nickName"), "avatar": GraphQLVariable("avatar"), "bio": GraphQLVariable("bio"), "platformType": GraphQLVariable("platformType"), "email": GraphQLVariable("email")], type: .object(CreateAuthUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var createAuthUser: CreateAuthUser? {
      get {
        (resultMap["createAuthUser"] as? ResultMap).flatMap { CreateAuthUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createAuthUser")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation createAuthUser($nickName: String!, $avatar: String, $bio: String, $platformType: String!, $email: String!) {
      createAuthUser(
        nickName: $nickName
        avatar: $avatar
        bio: $bio
        platformType: $platformType
        email: $email
      ) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "createAuthUser"

  public let operationIdentifier: String? = "04a7f83571acba225d94d0537794e6b57132d8f4921c93dcf6aa9c7cfeb958e8"

  public var nickName: String
  public var avatar: String?
  public var bio: String?
  public var platformType: String
  public var email: String

  public var variables: GraphQLMap? {
    ["nickName": nickName, "avatar": avatar, "bio": bio, "platformType": platformType, "email": email]
  }

}

// MARK: - CreateUserMutation

public final class CreateUserMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(bio: String? = nil, userName: String? = nil, gender: String? = nil, ageRange: String? = nil, email: String, nickName: String, avatar: String? = nil, password: String? = nil) {
    self.bio = bio
    self.userName = userName
    self.gender = gender
    self.ageRange = ageRange
    self.email = email
    self.nickName = nickName
    self.avatar = avatar
    self.password = password
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(createUser: CreateUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createUser": createUser.flatMap { (value: CreateUser) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct CreateUser: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "MutationResponse", "ok": ok, "error": error])
      }

      // MARK: Public

      public static let possibleTypes: [String] = ["MutationResponse"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public var __typename: String {
        get {
          resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }

    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("createUser", arguments: ["bio": GraphQLVariable("bio"), "userName": GraphQLVariable("userName"), "gender": GraphQLVariable("gender"), "ageRange": GraphQLVariable("ageRange"), "email": GraphQLVariable("email"), "nickName": GraphQLVariable("nickName"), "avatar": GraphQLVariable("avatar"), "password": GraphQLVariable("password")], type: .object(CreateUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var createUser: CreateUser? {
      get {
        (resultMap["createUser"] as? ResultMap).flatMap { CreateUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createUser")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation createUser($bio: String, $userName: String, $gender: String, $ageRange: String, $email: String!, $nickName: String!, $avatar: String, $password: String) {
      createUser(
        bio: $bio
        userName: $userName
        gender: $gender
        ageRange: $ageRange
        email: $email
        nickName: $nickName
        avatar: $avatar
        password: $password
      ) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "createUser"

  public let operationIdentifier: String? = "c1c85e1b61b7fc85fea2fdf9406facab1befba52c7508fdb8d9f3261529d5be3"

  public var bio: String?
  public var userName: String?
  public var gender: String?
  public var ageRange: String?
  public var email: String
  public var nickName: String
  public var avatar: String?
  public var password: String?

  public var variables: GraphQLMap? {
    ["bio": bio, "userName": userName, "gender": gender, "ageRange": ageRange, "email": email, "nickName": nickName, "avatar": avatar, "password": password]
  }

}

// MARK: - DeleteUserMutation

public final class DeleteUserMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init() {
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(deleteUser: DeleteUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteUser": deleteUser.flatMap { (value: DeleteUser) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct DeleteUser: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "MutationResponse", "ok": ok, "error": error])
      }

      // MARK: Public

      public static let possibleTypes: [String] = ["MutationResponse"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public var __typename: String {
        get {
          resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }

    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("deleteUser", type: .object(DeleteUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var deleteUser: DeleteUser? {
      get {
        (resultMap["deleteUser"] as? ResultMap).flatMap { DeleteUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteUser")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation deleteUser {
      deleteUser {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "deleteUser"

  public let operationIdentifier: String? = "5248bdf77c6381f260c810366e602f8ca2709fd34bf4a7f73e00afcf0bf5fb99"

}

// MARK: - EditUserMutation

public final class EditUserMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(nickName: String? = nil, bio: String? = nil, avatar: String? = nil, password: String? = nil, gender: String? = nil, ageRange: String? = nil) {
    self.nickName = nickName
    self.bio = bio
    self.avatar = avatar
    self.password = password
    self.gender = gender
    self.ageRange = ageRange
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(editUser: EditUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "editUser": editUser.flatMap { (value: EditUser) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct EditUser: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "MutationResponse", "ok": ok, "error": error])
      }

      // MARK: Public

      public static let possibleTypes: [String] = ["MutationResponse"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public var __typename: String {
        get {
          resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }

    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("editUser", arguments: ["nickName": GraphQLVariable("nickName"), "bio": GraphQLVariable("bio"), "avatar": GraphQLVariable("avatar"), "password": GraphQLVariable("password"), "gender": GraphQLVariable("gender"), "ageRange": GraphQLVariable("ageRange")], type: .object(EditUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var editUser: EditUser? {
      get {
        (resultMap["editUser"] as? ResultMap).flatMap { EditUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "editUser")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation editUser($nickName: String, $bio: String, $avatar: Upload, $password: String, $gender: String, $ageRange: String) {
      editUser(
        nickName: $nickName
        bio: $bio
        avatar: $avatar
        password: $password
        gender: $gender
        ageRange: $ageRange
      ) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "editUser"

  public let operationIdentifier: String? = "30de38953cac6350da6892a91a0b857d2566b974223afbb91453cbbbde69be12"

  public var nickName: String?
  public var bio: String?
  public var avatar: String?
  public var password: String?
  public var gender: String?
  public var ageRange: String?

  public var variables: GraphQLMap? {
    ["nickName": nickName, "bio": bio, "avatar": avatar, "password": password, "gender": gender, "ageRange": ageRange]
  }

}

// MARK: - NicknameCheckQuery

public final class NicknameCheckQuery: GraphQLQuery {

  // MARK: Lifecycle

  public init(payload: String) {
    self.payload = payload
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(nicknameCheck: NicknameCheck) {
      self.init(unsafeResultMap: ["__typename": "Query", "nicknameCheck": nicknameCheck.resultMap])
    }

    // MARK: Public

    public struct NicknameCheck: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "QueryResponse", "ok": ok, "error": error])
      }

      // MARK: Public

      public static let possibleTypes: [String] = ["QueryResponse"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public var __typename: String {
        get {
          resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }

    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("nicknameCheck", arguments: ["payload": GraphQLVariable("payload")], type: .nonNull(.object(NicknameCheck.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var nicknameCheck: NicknameCheck {
      get {
        NicknameCheck(unsafeResultMap: resultMap["nicknameCheck"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "nicknameCheck")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query nicknameCheck($payload: String!) {
      nicknameCheck(payload: $payload) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "nicknameCheck"

  public let operationIdentifier: String? = "66a8ce8913a377ae6c2aa74a64a317512b28119c58101cb51e65f6e218aa3ab7"

  public var payload: String

  public var variables: GraphQLMap? {
    ["payload": payload]
  }

}

// MARK: - PasswordCheckMutation

public final class PasswordCheckMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(payload: String) {
    self.payload = payload
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(passwordCheck: PasswordCheck? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "passwordCheck": passwordCheck.flatMap { (value: PasswordCheck) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct PasswordCheck: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "MutationResponse", "ok": ok, "error": error])
      }

      // MARK: Public

      public static let possibleTypes: [String] = ["MutationResponse"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public var __typename: String {
        get {
          resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }

    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("passwordCheck", arguments: ["payload": GraphQLVariable("payload")], type: .object(PasswordCheck.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var passwordCheck: PasswordCheck? {
      get {
        (resultMap["passwordCheck"] as? ResultMap).flatMap { PasswordCheck(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "passwordCheck")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation passwordCheck($payload: String!) {
      passwordCheck(payload: $payload) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "passwordCheck"

  public let operationIdentifier: String? = "0c6eb9b363e2c347d789d030a1657c2d2f772afed11c836079ee9f1d0eb8ae11"

  public var payload: String

  public var variables: GraphQLMap? {
    ["payload": payload]
  }

}

// MARK: - SeeProfileQuery

public final class SeeProfileQuery: GraphQLQuery {

  // MARK: Lifecycle

  public init(userName: String) {
    self.userName = userName
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(seeProfile: SeeProfile? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "seeProfile": seeProfile.flatMap { (value: SeeProfile) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct SeeProfile: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(id: Int, userName: String? = nil, nickName: String, email: String, avatar: String? = nil, bio: String? = nil, gender: String? = nil, ageRanger: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, reviews: [Review?]? = nil, places: [Place?]? = nil, platformType: String? = nil, suggestions: Suggestion? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "userName": userName, "nickName": nickName, "email": email, "avatar": avatar, "bio": bio, "gender": gender, "ageRanger": ageRanger, "createdAt": createdAt, "updatedAt": updatedAt, "reviews": reviews.flatMap { (value: [Review?]) -> [ResultMap?] in value.map { (value: Review?) -> ResultMap? in value.flatMap { (value: Review) -> ResultMap in value.resultMap } } }, "places": places.flatMap { (value: [Place?]) -> [ResultMap?] in value.map { (value: Place?) -> ResultMap? in value.flatMap { (value: Place) -> ResultMap in value.resultMap } } }, "platformType": platformType, "suggestions": suggestions.flatMap { (value: Suggestion) -> ResultMap in value.resultMap }])
      }

      // MARK: Public

      public struct Review: GraphQLSelectionSet {

        // MARK: Lifecycle

        public init(unsafeResultMap: ResultMap) {
          resultMap = unsafeResultMap
        }

        public init(id: Int, createdAt: String? = nil, updatedAt: String? = nil, title: String? = nil, content: String? = nil, upload: String? = nil, userId: Int? = nil, comments: [Comment?]? = nil, suggestions: Suggestion? = nil, placeId: Int? = nil, hashtags: [Hashtag?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Review", "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "title": title, "content": content, "upload": upload, "userId": userId, "comments": comments.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, "suggestions": suggestions.flatMap { (value: Suggestion) -> ResultMap in value.resultMap }, "placeId": placeId, "hashtags": hashtags.flatMap { (value: [Hashtag?]) -> [ResultMap?] in value.map { (value: Hashtag?) -> ResultMap? in value.flatMap { (value: Hashtag) -> ResultMap in value.resultMap } } }])
        }

        // MARK: Public

        public struct Comment: GraphQLSelectionSet {

          // MARK: Lifecycle

          public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
          }

          public init(id: Int, createdAt: String? = nil, updatedAt: String? = nil, payload: String? = nil, reviewId: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "payload": payload, "reviewId": reviewId])
          }

          // MARK: Public

          public static let possibleTypes: [String] = ["Comment"]

          public static var selections: [GraphQLSelection] {
            [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("createdAt", type: .scalar(String.self)),
              GraphQLField("updatedAt", type: .scalar(String.self)),
              GraphQLField("payload", type: .scalar(String.self)),
              GraphQLField("reviewId", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public var __typename: String {
            get {
              resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var createdAt: String? {
            get {
              resultMap["createdAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String? {
            get {
              resultMap["updatedAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "updatedAt")
            }
          }

          public var payload: String? {
            get {
              resultMap["payload"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "payload")
            }
          }

          public var reviewId: Int? {
            get {
              resultMap["reviewId"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "reviewId")
            }
          }
        }

        public struct Suggestion: GraphQLSelectionSet {

          // MARK: Lifecycle

          public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
          }

          public init(id: Int, like: Int? = nil, unLike: Int? = nil, reviewId: Int? = nil, userId: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Suggestion", "id": id, "like": like, "unLike": unLike, "reviewId": reviewId, "userId": userId])
          }

          // MARK: Public

          public static let possibleTypes: [String] = ["Suggestion"]

          public static var selections: [GraphQLSelection] {
            [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("like", type: .scalar(Int.self)),
              GraphQLField("unLike", type: .scalar(Int.self)),
              GraphQLField("reviewId", type: .scalar(Int.self)),
              GraphQLField("userId", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public var __typename: String {
            get {
              resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var like: Int? {
            get {
              resultMap["like"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "like")
            }
          }

          public var unLike: Int? {
            get {
              resultMap["unLike"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "unLike")
            }
          }

          public var reviewId: Int? {
            get {
              resultMap["reviewId"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "reviewId")
            }
          }

          public var userId: Int? {
            get {
              resultMap["userId"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "userId")
            }
          }
        }

        public struct Hashtag: GraphQLSelectionSet {

          // MARK: Lifecycle

          public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
          }

          public init(id: Int, hashTag: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "HashTag", "id": id, "hashTag": hashTag, "createdAt": createdAt, "updatedAt": updatedAt])
          }

          // MARK: Public

          public static let possibleTypes: [String] = ["HashTag"]

          public static var selections: [GraphQLSelection] {
            [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("hashTag", type: .scalar(String.self)),
              GraphQLField("createdAt", type: .scalar(String.self)),
              GraphQLField("updatedAt", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public var __typename: String {
            get {
              resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var hashTag: String? {
            get {
              resultMap["hashTag"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "hashTag")
            }
          }

          public var createdAt: String? {
            get {
              resultMap["createdAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String? {
            get {
              resultMap["updatedAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "updatedAt")
            }
          }
        }

        public static let possibleTypes: [String] = ["Review"]

        public static var selections: [GraphQLSelection] {
          [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAt", type: .scalar(String.self)),
            GraphQLField("updatedAt", type: .scalar(String.self)),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("content", type: .scalar(String.self)),
            GraphQLField("upload", type: .scalar(String.self)),
            GraphQLField("userId", type: .scalar(Int.self)),
            GraphQLField("comments", type: .list(.object(Comment.selections))),
            GraphQLField("suggestions", type: .object(Suggestion.selections)),
            GraphQLField("placeId", type: .scalar(Int.self)),
            GraphQLField("hashtags", type: .list(.object(Hashtag.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public var __typename: String {
          get {
            resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var createdAt: String? {
          get {
            resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            resultMap["updatedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var title: String? {
          get {
            resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var content: String? {
          get {
            resultMap["content"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "content")
          }
        }

        public var upload: String? {
          get {
            resultMap["upload"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "upload")
          }
        }

        public var userId: Int? {
          get {
            resultMap["userId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        public var comments: [Comment?]? {
          get {
            (resultMap["comments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Comment?] in value.map { (value: ResultMap?) -> Comment? in value.flatMap { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, forKey: "comments")
          }
        }

        public var suggestions: Suggestion? {
          get {
            (resultMap["suggestions"] as? ResultMap).flatMap { Suggestion(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "suggestions")
          }
        }

        public var placeId: Int? {
          get {
            resultMap["placeId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "placeId")
          }
        }

        public var hashtags: [Hashtag?]? {
          get {
            (resultMap["hashtags"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Hashtag?] in value.map { (value: ResultMap?) -> Hashtag? in value.flatMap { (value: ResultMap) -> Hashtag in Hashtag(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Hashtag?]) -> [ResultMap?] in value.map { (value: Hashtag?) -> ResultMap? in value.flatMap { (value: Hashtag) -> ResultMap in value.resultMap } } }, forKey: "hashtags")
          }
        }

      }

      public struct Place: GraphQLSelectionSet {

        // MARK: Lifecycle

        public init(unsafeResultMap: ResultMap) {
          resultMap = unsafeResultMap
        }

        public init(id: Int, createdAt: String? = nil, updatedAt: String? = nil, title: String, address: String, zipCode: Int? = nil, x: Int, y: Int, category: String? = nil, userId: Int? = nil, reviews: [Review?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Place", "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "title": title, "address": address, "zipCode": zipCode, "x": x, "y": y, "category": category, "userId": userId, "reviews": reviews.flatMap { (value: [Review?]) -> [ResultMap?] in value.map { (value: Review?) -> ResultMap? in value.flatMap { (value: Review) -> ResultMap in value.resultMap } } }])
        }

        // MARK: Public

        public struct Review: GraphQLSelectionSet {

          // MARK: Lifecycle

          public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
          }

          public init(id: Int, createdAt: String? = nil, updatedAt: String? = nil, title: String? = nil, content: String? = nil, upload: String? = nil, userId: Int? = nil, placeId: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Review", "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "title": title, "content": content, "upload": upload, "userId": userId, "placeId": placeId])
          }

          // MARK: Public

          public static let possibleTypes: [String] = ["Review"]

          public static var selections: [GraphQLSelection] {
            [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("createdAt", type: .scalar(String.self)),
              GraphQLField("updatedAt", type: .scalar(String.self)),
              GraphQLField("title", type: .scalar(String.self)),
              GraphQLField("content", type: .scalar(String.self)),
              GraphQLField("upload", type: .scalar(String.self)),
              GraphQLField("userId", type: .scalar(Int.self)),
              GraphQLField("placeId", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public var __typename: String {
            get {
              resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var createdAt: String? {
            get {
              resultMap["createdAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var updatedAt: String? {
            get {
              resultMap["updatedAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "updatedAt")
            }
          }

          public var title: String? {
            get {
              resultMap["title"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          public var content: String? {
            get {
              resultMap["content"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
            }
          }

          public var upload: String? {
            get {
              resultMap["upload"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "upload")
            }
          }

          public var userId: Int? {
            get {
              resultMap["userId"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "userId")
            }
          }

          public var placeId: Int? {
            get {
              resultMap["placeId"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "placeId")
            }
          }
        }

        public static let possibleTypes: [String] = ["Place"]

        public static var selections: [GraphQLSelection] {
          [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAt", type: .scalar(String.self)),
            GraphQLField("updatedAt", type: .scalar(String.self)),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("address", type: .nonNull(.scalar(String.self))),
            GraphQLField("zipCode", type: .scalar(Int.self)),
            GraphQLField("x", type: .nonNull(.scalar(Int.self))),
            GraphQLField("y", type: .nonNull(.scalar(Int.self))),
            GraphQLField("category", type: .scalar(String.self)),
            GraphQLField("userId", type: .scalar(Int.self)),
            GraphQLField("reviews", type: .list(.object(Review.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public var __typename: String {
          get {
            resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var createdAt: String? {
          get {
            resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String? {
          get {
            resultMap["updatedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var title: String {
          get {
            resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var address: String {
          get {
            resultMap["address"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "address")
          }
        }

        public var zipCode: Int? {
          get {
            resultMap["zipCode"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "zipCode")
          }
        }

        public var x: Int {
          get {
            resultMap["x"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "x")
          }
        }

        public var y: Int {
          get {
            resultMap["y"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "y")
          }
        }

        public var category: String? {
          get {
            resultMap["category"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "category")
          }
        }

        public var userId: Int? {
          get {
            resultMap["userId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        public var reviews: [Review?]? {
          get {
            (resultMap["reviews"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Review?] in value.map { (value: ResultMap?) -> Review? in value.flatMap { (value: ResultMap) -> Review in Review(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Review?]) -> [ResultMap?] in value.map { (value: Review?) -> ResultMap? in value.flatMap { (value: Review) -> ResultMap in value.resultMap } } }, forKey: "reviews")
          }
        }

      }

      public struct Suggestion: GraphQLSelectionSet {

        // MARK: Lifecycle

        public init(unsafeResultMap: ResultMap) {
          resultMap = unsafeResultMap
        }

        public init(id: Int, like: Int? = nil, unLike: Int? = nil, reviewId: Int? = nil, userId: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Suggestion", "id": id, "like": like, "unLike": unLike, "reviewId": reviewId, "userId": userId])
        }

        // MARK: Public

        public static let possibleTypes: [String] = ["Suggestion"]

        public static var selections: [GraphQLSelection] {
          [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("like", type: .scalar(Int.self)),
            GraphQLField("unLike", type: .scalar(Int.self)),
            GraphQLField("reviewId", type: .scalar(Int.self)),
            GraphQLField("userId", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public var __typename: String {
          get {
            resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var like: Int? {
          get {
            resultMap["like"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "like")
          }
        }

        public var unLike: Int? {
          get {
            resultMap["unLike"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "unLike")
          }
        }

        public var reviewId: Int? {
          get {
            resultMap["reviewId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "reviewId")
          }
        }

        public var userId: Int? {
          get {
            resultMap["userId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }
      }

      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("userName", type: .scalar(String.self)),
          GraphQLField("nickName", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .scalar(String.self)),
          GraphQLField("bio", type: .scalar(String.self)),
          GraphQLField("gender", type: .scalar(String.self)),
          GraphQLField("ageRanger", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("reviews", type: .list(.object(Review.selections))),
          GraphQLField("places", type: .list(.object(Place.selections))),
          GraphQLField("platformType", type: .scalar(String.self)),
          GraphQLField("suggestions", type: .object(Suggestion.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public var __typename: String {
        get {
          resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var userName: String? {
        get {
          resultMap["userName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userName")
        }
      }

      public var nickName: String {
        get {
          resultMap["nickName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "nickName")
        }
      }

      public var email: String {
        get {
          resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var avatar: String? {
        get {
          resultMap["avatar"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "avatar")
        }
      }

      public var bio: String? {
        get {
          resultMap["bio"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bio")
        }
      }

      public var gender: String? {
        get {
          resultMap["gender"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var ageRanger: String? {
        get {
          resultMap["ageRanger"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "ageRanger")
        }
      }

      public var createdAt: String? {
        get {
          resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var reviews: [Review?]? {
        get {
          (resultMap["reviews"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Review?] in value.map { (value: ResultMap?) -> Review? in value.flatMap { (value: ResultMap) -> Review in Review(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Review?]) -> [ResultMap?] in value.map { (value: Review?) -> ResultMap? in value.flatMap { (value: Review) -> ResultMap in value.resultMap } } }, forKey: "reviews")
        }
      }

      public var places: [Place?]? {
        get {
          (resultMap["places"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Place?] in value.map { (value: ResultMap?) -> Place? in value.flatMap { (value: ResultMap) -> Place in Place(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Place?]) -> [ResultMap?] in value.map { (value: Place?) -> ResultMap? in value.flatMap { (value: Place) -> ResultMap in value.resultMap } } }, forKey: "places")
        }
      }

      public var platformType: String? {
        get {
          resultMap["platformType"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "platformType")
        }
      }

      public var suggestions: Suggestion? {
        get {
          (resultMap["suggestions"] as? ResultMap).flatMap { Suggestion(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "suggestions")
        }
      }

    }

    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("seeProfile", arguments: ["userName": GraphQLVariable("userName")], type: .object(SeeProfile.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var seeProfile: SeeProfile? {
      get {
        (resultMap["seeProfile"] as? ResultMap).flatMap { SeeProfile(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "seeProfile")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query seeProfile($userName: String!) {
      seeProfile(userName: $userName) {
        __typename
        id
        userName
        nickName
        email
        avatar
        bio
        gender
        ageRanger
        createdAt
        updatedAt
        reviews {
          __typename
          id
          createdAt
          updatedAt
          title
          content
          upload
          userId
          comments {
            __typename
            id
            createdAt
            updatedAt
            payload
            reviewId
          }
          suggestions {
            __typename
            id
            like
            unLike
            reviewId
            userId
          }
          placeId
          hashtags {
            __typename
            id
            hashTag
            createdAt
            updatedAt
          }
        }
        places {
          __typename
          id
          createdAt
          updatedAt
          title
          address
          zipCode
          x
          y
          category
          userId
          reviews {
            __typename
            id
            createdAt
            updatedAt
            title
            content
            upload
            userId
            placeId
          }
        }
        platformType
        suggestions {
          __typename
          id
          like
          unLike
          reviewId
          userId
        }
      }
    }
    """

  public let operationName: String = "seeProfile"

  public let operationIdentifier: String? = "8ac9464e51d9aeafaf716e9a7afd6ab7e800d5311b09e1fdd7656d1db91b4776"

  public var userName: String

  public var variables: GraphQLMap? {
    ["userName": userName]
  }

}

// MARK: - UserLoginMutation

public final class UserLoginMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(userName: String, password: String) {
    self.userName = userName
    self.password = password
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(userLogin: UserLogin? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "userLogin": userLogin.flatMap { (value: UserLogin) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct UserLogin: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(ok: Bool? = nil, error: String? = nil, token: Token? = nil) {
        self.init(unsafeResultMap: ["__typename": "loginResponse", "ok": ok, "error": error, "token": token.flatMap { (value: Token) -> ResultMap in value.resultMap }])
      }

      // MARK: Public

      public struct Token: GraphQLSelectionSet {

        // MARK: Lifecycle

        public init(unsafeResultMap: ResultMap) {
          resultMap = unsafeResultMap
        }

        public init(accessToken: String, refreshToken: String) {
          self.init(unsafeResultMap: ["__typename": "Token", "accessToken": accessToken, "refreshToken": refreshToken])
        }

        // MARK: Public

        public static let possibleTypes: [String] = ["Token"]

        public static var selections: [GraphQLSelection] {
          [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("accessToken", type: .nonNull(.scalar(String.self))),
            GraphQLField("refreshToken", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public var __typename: String {
          get {
            resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var accessToken: String {
          get {
            resultMap["accessToken"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "accessToken")
          }
        }

        public var refreshToken: String {
          get {
            resultMap["refreshToken"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "refreshToken")
          }
        }
      }

      public static let possibleTypes: [String] = ["loginResponse"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .scalar(Bool.self)),
          GraphQLField("error", type: .scalar(String.self)),
          GraphQLField("token", type: .object(Token.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public var __typename: String {
        get {
          resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool? {
        get {
          resultMap["ok"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: String? {
        get {
          resultMap["error"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public var token: Token? {
        get {
          (resultMap["token"] as? ResultMap).flatMap { Token(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "token")
        }
      }

    }

    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("userLogin", arguments: ["userName": GraphQLVariable("userName"), "password": GraphQLVariable("password")], type: .object(UserLogin.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var userLogin: UserLogin? {
      get {
        (resultMap["userLogin"] as? ResultMap).flatMap { UserLogin(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "userLogin")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation userLogin($userName: String!, $password: String!) {
      userLogin(userName: $userName, password: $password) {
        __typename
        ok
        error
        token {
          __typename
          accessToken
          refreshToken
        }
      }
    }
    """

  public let operationName: String = "userLogin"

  public let operationIdentifier: String? = "1fa4022c4e9f33fe32bf6dc4a31977de56dd8e00c50136d25162e29d1e1aa2ec"

  public var userName: String
  public var password: String

  public var variables: GraphQLMap? {
    ["userName": userName, "password": password]
  }

}
