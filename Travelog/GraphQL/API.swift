// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct InputPlace: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - title
  ///   - address
  ///   - zipCode
  ///   - x
  ///   - y
  ///   - category
  ///   - placeId
  public init(title: String, address: String, zipCode: Swift.Optional<Int?> = nil, x: Double, y: Double, category: Swift.Optional<String?> = nil, placeId: String) {
    graphQLMap = ["title": title, "address": address, "zipCode": zipCode, "x": x, "y": y, "category": category, "placeId": placeId]
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var address: String {
    get {
      return graphQLMap["address"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "address")
    }
  }

  public var zipCode: Swift.Optional<Int?> {
    get {
      return graphQLMap["zipCode"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "zipCode")
    }
  }

  public var x: Double {
    get {
      return graphQLMap["x"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "x")
    }
  }

  public var y: Double {
    get {
      return graphQLMap["y"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "y")
    }
  }

  public var category: Swift.Optional<String?> {
    get {
      return graphQLMap["category"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "category")
    }
  }

  public var placeId: String {
    get {
      return graphQLMap["placeId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "placeId")
    }
  }
}

public final class AuthVaildationMutation: GraphQLMutation {
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

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("authVaildation", type: .object(AuthVaildation.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(authVaildation: AuthVaildation? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "authVaildation": authVaildation.flatMap { (value: AuthVaildation) -> ResultMap in value.resultMap }])
    }

    public var authVaildation: AuthVaildation? {
      get {
        return (resultMap["authVaildation"] as? ResultMap).flatMap { AuthVaildation(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "authVaildation")
      }
    }

    public struct AuthVaildation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["authResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
          GraphQLField("profile_image_url", type: .scalar(String.self)),
          GraphQLField("nickname", type: .scalar(String.self)),
          GraphQLField("gender", type: .scalar(String.self)),
          GraphQLField("age_range", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil, profileImageUrl: String? = nil, nickname: String? = nil, gender: String? = nil, ageRange: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "authResponse", "ok": ok, "error": error, "profile_image_url": profileImageUrl, "nickname": nickname, "gender": gender, "age_range": ageRange])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          return resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public var profileImageUrl: String? {
        get {
          return resultMap["profile_image_url"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profile_image_url")
        }
      }

      public var nickname: String? {
        get {
          return resultMap["nickname"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "nickname")
        }
      }

      public var gender: String? {
        get {
          return resultMap["gender"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var ageRange: String? {
        get {
          return resultMap["age_range"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "age_range")
        }
      }
    }
  }
}

public final class CreateAuthUserMutation: GraphQLMutation {
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

  public init(nickName: String, avatar: String? = nil, bio: String? = nil, platformType: String, email: String) {
    self.nickName = nickName
    self.avatar = avatar
    self.bio = bio
    self.platformType = platformType
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["nickName": nickName, "avatar": avatar, "bio": bio, "platformType": platformType, "email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createAuthUser", arguments: ["nickName": GraphQLVariable("nickName"), "avatar": GraphQLVariable("avatar"), "bio": GraphQLVariable("bio"), "platformType": GraphQLVariable("platformType"), "email": GraphQLVariable("email")], type: .object(CreateAuthUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createAuthUser: CreateAuthUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createAuthUser": createAuthUser.flatMap { (value: CreateAuthUser) -> ResultMap in value.resultMap }])
    }

    public var createAuthUser: CreateAuthUser? {
      get {
        return (resultMap["createAuthUser"] as? ResultMap).flatMap { CreateAuthUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createAuthUser")
      }
    }

    public struct CreateAuthUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MutationResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "MutationResponse", "ok": ok, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          return resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }
  }
}

public final class CreatePlaceMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation createPlace($place: [InputPlace]) {
      createPlace(place: $place) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "createPlace"

  public let operationIdentifier: String? = "3023c4d6eb955626fd2fdec2fbb0b0617b489b8adac1502dd1ad7827b44be243"

  public var place: [InputPlace?]?

  public init(place: [InputPlace?]? = nil) {
    self.place = place
  }

  public var variables: GraphQLMap? {
    return ["place": place]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createPlace", arguments: ["place": GraphQLVariable("place")], type: .object(CreatePlace.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createPlace: CreatePlace? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createPlace": createPlace.flatMap { (value: CreatePlace) -> ResultMap in value.resultMap }])
    }

    public var createPlace: CreatePlace? {
      get {
        return (resultMap["createPlace"] as? ResultMap).flatMap { CreatePlace(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createPlace")
      }
    }

    public struct CreatePlace: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MutationResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "MutationResponse", "ok": ok, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          return resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }
  }
}

public final class CreateUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation createUser($bio: String, $userName: String!, $gender: String, $ageRange: String, $email: String!, $nickName: String!, $avatar: String, $password: String!) {
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

  public let operationIdentifier: String? = "a00f2b37f66b1ebe864fac757a5194545886228b7e78204128314ba74ca7ab9c"

  public var bio: String?
  public var userName: String
  public var gender: String?
  public var ageRange: String?
  public var email: String
  public var nickName: String
  public var avatar: String?
  public var password: String

  public init(bio: String? = nil, userName: String, gender: String? = nil, ageRange: String? = nil, email: String, nickName: String, avatar: String? = nil, password: String) {
    self.bio = bio
    self.userName = userName
    self.gender = gender
    self.ageRange = ageRange
    self.email = email
    self.nickName = nickName
    self.avatar = avatar
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["bio": bio, "userName": userName, "gender": gender, "ageRange": ageRange, "email": email, "nickName": nickName, "avatar": avatar, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createUser", arguments: ["bio": GraphQLVariable("bio"), "userName": GraphQLVariable("userName"), "gender": GraphQLVariable("gender"), "ageRange": GraphQLVariable("ageRange"), "email": GraphQLVariable("email"), "nickName": GraphQLVariable("nickName"), "avatar": GraphQLVariable("avatar"), "password": GraphQLVariable("password")], type: .object(CreateUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createUser: CreateUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createUser": createUser.flatMap { (value: CreateUser) -> ResultMap in value.resultMap }])
    }

    public var createUser: CreateUser? {
      get {
        return (resultMap["createUser"] as? ResultMap).flatMap { CreateUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MutationResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "MutationResponse", "ok": ok, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          return resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }
  }
}

public final class DeletePlaceMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation deletePlace($id: Int!) {
      deletePlace(id: $id) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "deletePlace"

  public let operationIdentifier: String? = "ac033692911a3a35eb3690f6ee14a97b5c6156517480929b1204e1d4b2bf540a"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deletePlace", arguments: ["id": GraphQLVariable("id")], type: .object(DeletePlace.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deletePlace: DeletePlace? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deletePlace": deletePlace.flatMap { (value: DeletePlace) -> ResultMap in value.resultMap }])
    }

    public var deletePlace: DeletePlace? {
      get {
        return (resultMap["deletePlace"] as? ResultMap).flatMap { DeletePlace(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deletePlace")
      }
    }

    public struct DeletePlace: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MutationResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "MutationResponse", "ok": ok, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          return resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }
  }
}

public final class DeleteUserMutation: GraphQLMutation {
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

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteUser", type: .object(DeleteUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteUser: DeleteUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteUser": deleteUser.flatMap { (value: DeleteUser) -> ResultMap in value.resultMap }])
    }

    public var deleteUser: DeleteUser? {
      get {
        return (resultMap["deleteUser"] as? ResultMap).flatMap { DeleteUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteUser")
      }
    }

    public struct DeleteUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MutationResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "MutationResponse", "ok": ok, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          return resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }
  }
}

public final class EditUserMutation: GraphQLMutation {
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

  public init(nickName: String? = nil, bio: String? = nil, avatar: String? = nil, password: String? = nil, gender: String? = nil, ageRange: String? = nil) {
    self.nickName = nickName
    self.bio = bio
    self.avatar = avatar
    self.password = password
    self.gender = gender
    self.ageRange = ageRange
  }

  public var variables: GraphQLMap? {
    return ["nickName": nickName, "bio": bio, "avatar": avatar, "password": password, "gender": gender, "ageRange": ageRange]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("editUser", arguments: ["nickName": GraphQLVariable("nickName"), "bio": GraphQLVariable("bio"), "avatar": GraphQLVariable("avatar"), "password": GraphQLVariable("password"), "gender": GraphQLVariable("gender"), "ageRange": GraphQLVariable("ageRange")], type: .object(EditUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(editUser: EditUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "editUser": editUser.flatMap { (value: EditUser) -> ResultMap in value.resultMap }])
    }

    public var editUser: EditUser? {
      get {
        return (resultMap["editUser"] as? ResultMap).flatMap { EditUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "editUser")
      }
    }

    public struct EditUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MutationResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "MutationResponse", "ok": ok, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          return resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }
  }
}

public final class OAuthUserLoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation OAuthUserLogin($platform_type: String!, $accesstoken: String!) {
      authUserLogin(platform_type: $platform_type, accesstoken: $accesstoken) {
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

  public let operationName: String = "OAuthUserLogin"

  public let operationIdentifier: String? = "3d6c5a545d9bc2a40d5cd8802da1297f334236a5c9c6c5519286b0d95c7d1b58"

  public var platform_type: String
  public var accesstoken: String

  public init(platform_type: String, accesstoken: String) {
    self.platform_type = platform_type
    self.accesstoken = accesstoken
  }

  public var variables: GraphQLMap? {
    return ["platform_type": platform_type, "accesstoken": accesstoken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("authUserLogin", arguments: ["platform_type": GraphQLVariable("platform_type"), "accesstoken": GraphQLVariable("accesstoken")], type: .object(AuthUserLogin.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(authUserLogin: AuthUserLogin? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "authUserLogin": authUserLogin.flatMap { (value: AuthUserLogin) -> ResultMap in value.resultMap }])
    }

    public var authUserLogin: AuthUserLogin? {
      get {
        return (resultMap["authUserLogin"] as? ResultMap).flatMap { AuthUserLogin(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "authUserLogin")
      }
    }

    public struct AuthUserLogin: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["loginResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .scalar(Bool.self)),
          GraphQLField("error", type: .scalar(Int.self)),
          GraphQLField("token", type: .object(Token.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool? = nil, error: Int? = nil, token: Token? = nil) {
        self.init(unsafeResultMap: ["__typename": "loginResponse", "ok": ok, "error": error, "token": token.flatMap { (value: Token) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool? {
        get {
          return resultMap["ok"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          return resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public var token: Token? {
        get {
          return (resultMap["token"] as? ResultMap).flatMap { Token(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "token")
        }
      }

      public struct Token: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Token"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("accessToken", type: .nonNull(.scalar(String.self))),
            GraphQLField("refreshToken", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(accessToken: String, refreshToken: String) {
          self.init(unsafeResultMap: ["__typename": "Token", "accessToken": accessToken, "refreshToken": refreshToken])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var accessToken: String {
          get {
            return resultMap["accessToken"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "accessToken")
          }
        }

        public var refreshToken: String {
          get {
            return resultMap["refreshToken"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "refreshToken")
          }
        }
      }
    }
  }
}

public final class SearchPlaceQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query searchPlace($title: String!, $category: String, $lastId: Int) {
      searchPlace(title: $title, category: $category, lastId: $lastId) {
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
      }
    }
    """

  public let operationName: String = "searchPlace"

  public let operationIdentifier: String? = "0773011563df8f08055d5b1851d1ec9c59a4ee3c8c703945ea3da1c22a99f988"

  public var title: String
  public var category: String?
  public var lastId: Int?

  public init(title: String, category: String? = nil, lastId: Int? = nil) {
    self.title = title
    self.category = category
    self.lastId = lastId
  }

  public var variables: GraphQLMap? {
    return ["title": title, "category": category, "lastId": lastId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("searchPlace", arguments: ["title": GraphQLVariable("title"), "category": GraphQLVariable("category"), "lastId": GraphQLVariable("lastId")], type: .list(.object(SearchPlace.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(searchPlace: [SearchPlace?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "searchPlace": searchPlace.flatMap { (value: [SearchPlace?]) -> [ResultMap?] in value.map { (value: SearchPlace?) -> ResultMap? in value.flatMap { (value: SearchPlace) -> ResultMap in value.resultMap } } }])
    }

    public var searchPlace: [SearchPlace?]? {
      get {
        return (resultMap["searchPlace"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SearchPlace?] in value.map { (value: ResultMap?) -> SearchPlace? in value.flatMap { (value: ResultMap) -> SearchPlace in SearchPlace(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SearchPlace?]) -> [ResultMap?] in value.map { (value: SearchPlace?) -> ResultMap? in value.flatMap { (value: SearchPlace) -> ResultMap in value.resultMap } } }, forKey: "searchPlace")
      }
    }

    public struct SearchPlace: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Place"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("address", type: .nonNull(.scalar(String.self))),
          GraphQLField("zipCode", type: .scalar(Int.self)),
          GraphQLField("x", type: .nonNull(.scalar(Double.self))),
          GraphQLField("y", type: .nonNull(.scalar(Double.self))),
          GraphQLField("category", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, createdAt: String? = nil, updatedAt: String? = nil, title: String, address: String, zipCode: Int? = nil, x: Double, y: Double, category: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Place", "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "title": title, "address": address, "zipCode": zipCode, "x": x, "y": y, "category": category])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var address: String {
        get {
          return resultMap["address"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "address")
        }
      }

      public var zipCode: Int? {
        get {
          return resultMap["zipCode"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "zipCode")
        }
      }

      public var x: Double {
        get {
          return resultMap["x"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "x")
        }
      }

      public var y: Double {
        get {
          return resultMap["y"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "y")
        }
      }

      public var category: String? {
        get {
          return resultMap["category"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "category")
        }
      }
    }
  }
}

public final class SeeProfileQuery: GraphQLQuery {
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
        platformType
      }
    }
    """

  public let operationName: String = "seeProfile"

  public let operationIdentifier: String? = "82fedfbfbf51c5b207939d62c9cc80766e7d08d6ab52521b7f2c975166424550"

  public var userName: String

  public init(userName: String) {
    self.userName = userName
  }

  public var variables: GraphQLMap? {
    return ["userName": userName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("seeProfile", arguments: ["userName": GraphQLVariable("userName")], type: .object(SeeProfile.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(seeProfile: SeeProfile? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "seeProfile": seeProfile.flatMap { (value: SeeProfile) -> ResultMap in value.resultMap }])
    }

    public var seeProfile: SeeProfile? {
      get {
        return (resultMap["seeProfile"] as? ResultMap).flatMap { SeeProfile(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "seeProfile")
      }
    }

    public struct SeeProfile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
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
          GraphQLField("platformType", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, userName: String? = nil, nickName: String, email: String, avatar: String? = nil, bio: String? = nil, gender: String? = nil, ageRanger: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, platformType: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "userName": userName, "nickName": nickName, "email": email, "avatar": avatar, "bio": bio, "gender": gender, "ageRanger": ageRanger, "createdAt": createdAt, "updatedAt": updatedAt, "platformType": platformType])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var userName: String? {
        get {
          return resultMap["userName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userName")
        }
      }

      public var nickName: String {
        get {
          return resultMap["nickName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "nickName")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var avatar: String? {
        get {
          return resultMap["avatar"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "avatar")
        }
      }

      public var bio: String? {
        get {
          return resultMap["bio"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bio")
        }
      }

      public var gender: String? {
        get {
          return resultMap["gender"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var ageRanger: String? {
        get {
          return resultMap["ageRanger"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "ageRanger")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var platformType: String? {
        get {
          return resultMap["platformType"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "platformType")
        }
      }
    }
  }
}

public final class UpdatePlaceMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation updatePlace($id: Int!) {
      updatePlace(id: $id) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "updatePlace"

  public let operationIdentifier: String? = "c635c03777d030e6b7242fbb44a3f62107a68dcedf7966836f88af8de58d0673"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updatePlace", arguments: ["id": GraphQLVariable("id")], type: .object(UpdatePlace.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updatePlace: UpdatePlace? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updatePlace": updatePlace.flatMap { (value: UpdatePlace) -> ResultMap in value.resultMap }])
    }

    public var updatePlace: UpdatePlace? {
      get {
        return (resultMap["updatePlace"] as? ResultMap).flatMap { UpdatePlace(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updatePlace")
      }
    }

    public struct UpdatePlace: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MutationResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "MutationResponse", "ok": ok, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          return resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }
  }
}

public final class NickNameValidationQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query nickNameValidation($nickName: String) {
      userCheck(nickName: $nickName) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "nickNameValidation"

  public let operationIdentifier: String? = "068bb42b56080aeb5a1898d8ecaac4867233cfe60e9febef4f77345525f59dac"

  public var nickName: String?

  public init(nickName: String? = nil) {
    self.nickName = nickName
  }

  public var variables: GraphQLMap? {
    return ["nickName": nickName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("userCheck", arguments: ["nickName": GraphQLVariable("nickName")], type: .object(UserCheck.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(userCheck: UserCheck? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "userCheck": userCheck.flatMap { (value: UserCheck) -> ResultMap in value.resultMap }])
    }

    public var userCheck: UserCheck? {
      get {
        return (resultMap["userCheck"] as? ResultMap).flatMap { UserCheck(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "userCheck")
      }
    }

    public struct UserCheck: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["QueryResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "QueryResponse", "ok": ok, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          return resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }
  }
}

public final class EmailValidationQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query emailValidation($email: String) {
      userCheck(email: $email) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "emailValidation"

  public let operationIdentifier: String? = "16e14e7118f4f58c2c2f976594d854bc3d8f6ec569b3aa806860a6f30bbcf02f"

  public var email: String?

  public init(email: String? = nil) {
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("userCheck", arguments: ["email": GraphQLVariable("email")], type: .object(UserCheck.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(userCheck: UserCheck? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "userCheck": userCheck.flatMap { (value: UserCheck) -> ResultMap in value.resultMap }])
    }

    public var userCheck: UserCheck? {
      get {
        return (resultMap["userCheck"] as? ResultMap).flatMap { UserCheck(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "userCheck")
      }
    }

    public struct UserCheck: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["QueryResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("error", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool, error: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "QueryResponse", "ok": ok, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          return resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }
    }
  }
}

public final class UserLoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UserLogin($userName: String!, $password: String!) {
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

  public let operationName: String = "UserLogin"

  public let operationIdentifier: String? = "9bc6227993cccf73b5f29c2b35a38394a44b255d203744fd6f498d2bed3031db"

  public var userName: String
  public var password: String

  public init(userName: String, password: String) {
    self.userName = userName
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["userName": userName, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("userLogin", arguments: ["userName": GraphQLVariable("userName"), "password": GraphQLVariable("password")], type: .object(UserLogin.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(userLogin: UserLogin? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "userLogin": userLogin.flatMap { (value: UserLogin) -> ResultMap in value.resultMap }])
    }

    public var userLogin: UserLogin? {
      get {
        return (resultMap["userLogin"] as? ResultMap).flatMap { UserLogin(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "userLogin")
      }
    }

    public struct UserLogin: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["loginResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ok", type: .scalar(Bool.self)),
          GraphQLField("error", type: .scalar(Int.self)),
          GraphQLField("token", type: .object(Token.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool? = nil, error: Int? = nil, token: Token? = nil) {
        self.init(unsafeResultMap: ["__typename": "loginResponse", "ok": ok, "error": error, "token": token.flatMap { (value: Token) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool? {
        get {
          return resultMap["ok"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var error: Int? {
        get {
          return resultMap["error"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public var token: Token? {
        get {
          return (resultMap["token"] as? ResultMap).flatMap { Token(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "token")
        }
      }

      public struct Token: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Token"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("accessToken", type: .nonNull(.scalar(String.self))),
            GraphQLField("refreshToken", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(accessToken: String, refreshToken: String) {
          self.init(unsafeResultMap: ["__typename": "Token", "accessToken": accessToken, "refreshToken": refreshToken])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var accessToken: String {
          get {
            return resultMap["accessToken"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "accessToken")
          }
        }

        public var refreshToken: String {
          get {
            return resultMap["refreshToken"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "refreshToken")
          }
        }
      }
    }
  }
}
