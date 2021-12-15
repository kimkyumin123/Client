// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

// MARK: - InputPlace

public struct InputPlace: GraphQLMapConvertible {

  // MARK: Lifecycle

  /// - Parameters:
  ///   - title
  ///   - address
  ///   - zipCode
  ///   - x
  ///   - y
  ///   - category
  ///   - placeId
  public init(title: String, address: String, zipCode: Int?? = nil, x: Double, y: Double, category: String?? = nil, placeId: String) {
    graphQLMap = ["title": title, "address": address, "zipCode": zipCode, "x": x, "y": y, "category": category, "placeId": placeId]
  }

  // MARK: Public

  public var graphQLMap: GraphQLMap

  public var title: String {
    get {
      graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var address: String {
    get {
      graphQLMap["address"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "address")
    }
  }

  public var zipCode: Int?? {
    get {
      graphQLMap["zipCode"] as? Int?? ?? Int??.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "zipCode")
    }
  }

  public var x: Double {
    get {
      graphQLMap["x"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "x")
    }
  }

  public var y: Double {
    get {
      graphQLMap["y"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "y")
    }
  }

  public var category: String?? {
    get {
      graphQLMap["category"] as? String?? ?? String??.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "category")
    }
  }

  public var placeId: String {
    get {
      graphQLMap["placeId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "placeId")
    }
  }
}

// MARK: - ReviewInput

public struct ReviewInput: GraphQLMapConvertible {

  // MARK: Lifecycle

  /// - Parameters:
  ///   - title
  ///   - content
  ///   - place
  ///   - hashtags
  public init(title: String, content: String, place: InputPlace, hashtags: String?? = nil) {
    graphQLMap = ["title": title, "content": content, "place": place, "hashtags": hashtags]
  }

  // MARK: Public

  public var graphQLMap: GraphQLMap

  public var title: String {
    get {
      graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var content: String {
    get {
      graphQLMap["content"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var place: InputPlace {
    get {
      graphQLMap["place"] as! InputPlace
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "place")
    }
  }

  public var hashtags: String?? {
    get {
      graphQLMap["hashtags"] as? String?? ?? String??.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "hashtags")
    }
  }
}

// MARK: - ReviewUpload

public struct ReviewUpload: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - upload
  public init(upload: String) {
    graphQLMap = ["upload": upload]
  }

  public var upload: String {
    get {
      graphQLMap["upload"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "upload")
    }
  }
}

// MARK: - UpdatePlaceInput

public struct UpdatePlaceInput: GraphQLMapConvertible {

  // MARK: Lifecycle

  /// - Parameters:
  ///   - id
  ///   - title
  ///   - address
  ///   - zipCode
  ///   - x
  ///   - y
  ///   - category
  ///   - placeId
  public init(id: Int, title: String?? = nil, address: String?? = nil, zipCode: Int?? = nil, x: Double?? = nil, y: Double?? = nil, category: String?? = nil, placeId: String?? = nil) {
    graphQLMap = ["id": id, "title": title, "address": address, "zipCode": zipCode, "x": x, "y": y, "category": category, "placeId": placeId]
  }

  // MARK: Public

  public var graphQLMap: GraphQLMap

  public var id: Int {
    get {
      graphQLMap["id"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var title: String?? {
    get {
      graphQLMap["title"] as? String?? ?? String??.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var address: String?? {
    get {
      graphQLMap["address"] as? String?? ?? String??.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "address")
    }
  }

  public var zipCode: Int?? {
    get {
      graphQLMap["zipCode"] as? Int?? ?? Int??.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "zipCode")
    }
  }

  public var x: Double?? {
    get {
      graphQLMap["x"] as? Double?? ?? Double??.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "x")
    }
  }

  public var y: Double?? {
    get {
      graphQLMap["y"] as? Double?? ?? Double??.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "y")
    }
  }

  public var category: String?? {
    get {
      graphQLMap["category"] as? String?? ?? String??.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "category")
    }
  }

  public var placeId: String?? {
    get {
      graphQLMap["placeId"] as? String?? ?? String??.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "placeId")
    }
  }
}

// MARK: - AuthValidationMutation

public final class AuthValidationMutation: GraphQLMutation {

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

      public init(ok: Bool, error: Int? = nil, profileImageUrl: String? = nil, nickname: String? = nil, gender: String? = nil, ageRange: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "authResponse", "ok": ok, "error": error, "profile_image_url": profileImageUrl, "nickname": nickname, "gender": gender, "age_range": ageRange])
      }

      // MARK: Public

      public static let possibleTypes: [String] = ["authResponse"]

      public static var selections: [GraphQLSelection] {
        [
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
    mutation authValidation {
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

  public let operationName: String = "authValidation"

  public let operationIdentifier: String? = "b8c064245df2c0e897527edec5c66ae6b8cae5593cc14226440b6be5e4367d8a"

}

// MARK: - CommentsQuery

public final class CommentsQuery: GraphQLQuery {

  // MARK: Lifecycle

  public init(reviewID: Int? = nil) {
    self.reviewID = reviewID
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(searchReview: [SearchReview]) {
      self.init(unsafeResultMap: ["__typename": "Query", "searchReview": searchReview.map { (value: SearchReview) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct SearchReview: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(comments: [Comment?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Review", "comments": comments.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }])
      }

      // MARK: Public

      public struct Comment: GraphQLSelectionSet {

        // MARK: Lifecycle

        public init(unsafeResultMap: ResultMap) {
          resultMap = unsafeResultMap
        }

        public init(id: Int, userId: Int, createdAt: String, updatedAt: String, payload: String) {
          self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "userId": userId, "createdAt": createdAt, "updatedAt": updatedAt, "payload": payload])
        }

        // MARK: Public

        public static let possibleTypes: [String] = ["Comment"]

        public static var selections: [GraphQLSelection] {
          [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("payload", type: .nonNull(.scalar(String.self))),
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

        /// PK
        public var id: Int {
          get {
            resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// 작성유저ID
        public var userId: Int {
          get {
            resultMap["userId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        /// 생성날짜
        public var createdAt: String {
          get {
            resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        /// 수정날짜
        public var updatedAt: String {
          get {
            resultMap["updatedAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updatedAt")
          }
        }

        /// 댓글내용
        public var payload: String {
          get {
            resultMap["payload"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "payload")
          }
        }
      }

      public static let possibleTypes: [String] = ["Review"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("comments", type: .list(.object(Comment.selections))),
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

      /// 댓글
      public var comments: [Comment?]? {
        get {
          (resultMap["comments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Comment?] in value.map { (value: ResultMap?) -> Comment? in value.flatMap { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, forKey: "comments")
        }
      }

    }

    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("searchReview", arguments: ["id": GraphQLVariable("reviewID")], type: .nonNull(.list(.nonNull(.object(SearchReview.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    /// id -  PK
    ///
    /// title - 리뷰명(Startwith)
    ///
    /// category - 카테고리
    ///
    /// lastId - Pagination처리 변수
    public var searchReview: [SearchReview] {
      get {
        (resultMap["searchReview"] as! [ResultMap]).map { (value: ResultMap) -> SearchReview in SearchReview(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: SearchReview) -> ResultMap in value.resultMap }, forKey: "searchReview")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query comments($reviewID: Int) {
      searchReview(id: $reviewID) {
        __typename
        comments {
          __typename
          id
          userId
          createdAt
          updatedAt
          payload
        }
      }
    }
    """

  public let operationName: String = "comments"

  public let operationIdentifier: String? = "378b30b4cf4db374ea186740b0b93de3a10d1cf511b5ff882e5f32c5e82a8421"

  public var reviewID: Int?

  public var variables: GraphQLMap? {
    ["reviewID": reviewID]
  }

}

// MARK: - CreateAuthUserMutation

public final class CreateAuthUserMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(nickName: String, avatar: String? = nil, bio: String? = nil, platformType: String, token: String) {
    self.nickName = nickName
    self.avatar = avatar
    self.bio = bio
    self.platformType = platformType
    self.token = token
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
        GraphQLField("createAuthUser", arguments: ["nickName": GraphQLVariable("nickName"), "avatar": GraphQLVariable("avatar"), "bio": GraphQLVariable("bio"), "platformType": GraphQLVariable("platformType"), "token": GraphQLVariable("token")], type: .object(CreateAuthUser.selections)),
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
    mutation createAuthUser($nickName: String!, $avatar: Upload, $bio: String, $platformType: String!, $token: String!) {
      createAuthUser(
        nickName: $nickName
        avatar: $avatar
        bio: $bio
        platformType: $platformType
        token: $token
      ) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "createAuthUser"

  public let operationIdentifier: String? = "24fbe06876ad34d4fdf0e4c53d63c83ce311abcf2c2dfb5a486011555567cd51"

  public var nickName: String
  public var avatar: String?
  public var bio: String?
  public var platformType: String
  public var token: String

  public var variables: GraphQLMap? {
    ["nickName": nickName, "avatar": avatar, "bio": bio, "platformType": platformType, "token": token]
  }

}

// MARK: - CreatePlaceMutation

public final class CreatePlaceMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(place: [InputPlace?]? = nil) {
    self.place = place
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(createPlace: CreatePlace? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createPlace": createPlace.flatMap { (value: CreatePlace) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct CreatePlace: GraphQLSelectionSet {

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
        GraphQLField("createPlace", arguments: ["place": GraphQLVariable("place")], type: .object(CreatePlace.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    /// 실제 사용하지 않는 뮤테이션이며 임의로 추가할 장소가 있을시 호출합니다.
    public var createPlace: CreatePlace? {
      get {
        (resultMap["createPlace"] as? ResultMap).flatMap { CreatePlace(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createPlace")
      }
    }

  }

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

  public var variables: GraphQLMap? {
    ["place": place]
  }

}

// MARK: - CreateReviewMutation

public final class CreateReviewMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(reviews: [ReviewInput], images: [ReviewUpload]) {
    self.reviews = reviews
    self.images = images
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(createReview: CreateReview? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createReview": createReview.flatMap { (value: CreateReview) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct CreateReview: GraphQLSelectionSet {

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
        GraphQLField("createReview", arguments: ["review": GraphQLVariable("reviews"), "upload": GraphQLVariable("images")], type: .object(CreateReview.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var createReview: CreateReview? {
      get {
        (resultMap["createReview"] as? ResultMap).flatMap { CreateReview(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createReview")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation createReview($reviews: [ReviewInput!]!, $images: [ReviewUpload!]!) {
      createReview(review: $reviews, upload: $images) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "createReview"

  public let operationIdentifier: String? = "53d533606091401c2dd7f3bbd34acfae5981bf9f9113160fae5edf72479b23fa"

  public var reviews: [ReviewInput]
  public var images: [ReviewUpload]

  public var variables: GraphQLMap? {
    ["reviews": reviews, "images": images]
  }

}

// MARK: - CreateUserMutation

public final class CreateUserMutation: GraphQLMutation {

  // MARK: Lifecycle

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
    mutation createUser($bio: String, $userName: String!, $gender: String, $ageRange: String, $email: String!, $nickName: String!, $avatar: Upload, $password: String!) {
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

  public let operationIdentifier: String? = "9afa4f56bb8ecdfa8d50c7283b30b607f3e8450af927977521930f8f52a01d47"

  public var bio: String?
  public var userName: String
  public var gender: String?
  public var ageRange: String?
  public var email: String
  public var nickName: String
  public var avatar: String?
  public var password: String

  public var variables: GraphQLMap? {
    ["bio": bio, "userName": userName, "gender": gender, "ageRange": ageRange, "email": email, "nickName": nickName, "avatar": avatar, "password": password]
  }

}

// MARK: - DeletePlaceMutation

public final class DeletePlaceMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(id: Int) {
    self.id = id
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(deletePlace: DeletePlace? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deletePlace": deletePlace.flatMap { (value: DeletePlace) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct DeletePlace: GraphQLSelectionSet {

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
        GraphQLField("deletePlace", arguments: ["id": GraphQLVariable("id")], type: .object(DeletePlace.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    /// 장소삭제 : 장소 PK(ID)로 삭제
    public var deletePlace: DeletePlace? {
      get {
        (resultMap["deletePlace"] as? ResultMap).flatMap { DeletePlace(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deletePlace")
      }
    }

  }

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

  public var variables: GraphQLMap? {
    ["id": id]
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

// MARK: - LogoutMutation

public final class LogoutMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init() {
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(userLogout: UserLogout? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "userLogout": userLogout.flatMap { (value: UserLogout) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct UserLogout: GraphQLSelectionSet {

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
        GraphQLField("userLogout", type: .object(UserLogout.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var userLogout: UserLogout? {
      get {
        (resultMap["userLogout"] as? ResultMap).flatMap { UserLogout(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "userLogout")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation logout {
      userLogout {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "logout"

  public let operationIdentifier: String? = "98e63f027ac2e21f125b27e27449d7b5241558d3a09e6876117aa32b0d869391"

}

// MARK: - OAuthUserLoginMutation

public final class OAuthUserLoginMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(platform_type: String, accesstoken: String) {
    self.platform_type = platform_type
    self.accesstoken = accesstoken
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

      public init(ok: Bool? = nil, error: Int? = nil, token: Token? = nil) {
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
          GraphQLField("error", type: .scalar(Int.self)),
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

      public var error: Int? {
        get {
          resultMap["error"] as? Int
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
        GraphQLField("authUserLogin", arguments: ["platform_type": GraphQLVariable("platform_type"), "accesstoken": GraphQLVariable("accesstoken")], type: .object(AuthUserLogin.selections)),
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

  public var variables: GraphQLMap? {
    ["platform_type": platform_type, "accesstoken": accesstoken]
  }

}

// MARK: - PostQuery

public final class PostQuery: GraphQLQuery {

  // MARK: Lifecycle

  public init(id: Int) {
    self.id = id
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(searchReviewRoom: SearchReviewRoom? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "searchReviewRoom": searchReviewRoom.flatMap { (value: SearchReviewRoom) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct SearchReviewRoom: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(id: Int, createdAt: String, updatedAt: String, review: [Review]) {
        self.init(unsafeResultMap: ["__typename": "reviewRoom", "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "review": review.map { (value: Review) -> ResultMap in value.resultMap }])
      }

      // MARK: Public

      public struct Review: GraphQLSelectionSet {

        // MARK: Lifecycle

        public init(unsafeResultMap: ResultMap) {
          resultMap = unsafeResultMap
        }

        public init(id: Int, createdAt: String, updatedAt: String, title: String, content: String, upload: String, userId: Int, placeId: Int? = nil, getLikes: Int, getUnLikes: Int, isLike: Bool, isUnLike: Bool, comments: [Comment?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Review", "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "title": title, "content": content, "upload": upload, "userId": userId, "placeId": placeId, "getLikes": getLikes, "getUnLikes": getUnLikes, "isLike": isLike, "isUnLike": isUnLike, "comments": comments.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }])
        }

        // MARK: Public

        public struct Comment: GraphQLSelectionSet {

          // MARK: Lifecycle

          public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
          }

          public init(id: Int, userId: Int, createdAt: String, updatedAt: String, payload: String) {
            self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "userId": userId, "createdAt": createdAt, "updatedAt": updatedAt, "payload": payload])
          }

          // MARK: Public

          public static let possibleTypes: [String] = ["Comment"]

          public static var selections: [GraphQLSelection] {
            [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("payload", type: .nonNull(.scalar(String.self))),
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

          /// PK
          public var id: Int {
            get {
              resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// 작성유저ID
          public var userId: Int {
            get {
              resultMap["userId"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "userId")
            }
          }

          /// 생성날짜
          public var createdAt: String {
            get {
              resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          /// 수정날짜
          public var updatedAt: String {
            get {
              resultMap["updatedAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "updatedAt")
            }
          }

          /// 댓글내용
          public var payload: String {
            get {
              resultMap["payload"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "payload")
            }
          }
        }

        public static let possibleTypes: [String] = ["Review"]

        public static var selections: [GraphQLSelection] {
          [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("upload", type: .nonNull(.scalar(String.self))),
            GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
            GraphQLField("placeId", type: .scalar(Int.self)),
            GraphQLField("getLikes", type: .nonNull(.scalar(Int.self))),
            GraphQLField("getUnLikes", type: .nonNull(.scalar(Int.self))),
            GraphQLField("isLike", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("isUnLike", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("comments", type: .list(.object(Comment.selections))),
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

        /// PK
        public var id: Int {
          get {
            resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// 생성날짜
        public var createdAt: String {
          get {
            resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        /// 수정날짜
        public var updatedAt: String {
          get {
            resultMap["updatedAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updatedAt")
          }
        }

        /// 제목
        public var title: String {
          get {
            resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        /// 내용
        public var content: String {
          get {
            resultMap["content"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "content")
          }
        }

        /// 사진
        public var upload: String {
          get {
            resultMap["upload"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "upload")
          }
        }

        /// 생성유저ID
        public var userId: Int {
          get {
            resultMap["userId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "userId")
          }
        }

        /// 장소 PK
        public var placeId: Int? {
          get {
            resultMap["placeId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "placeId")
          }
        }

        /// 좋아요 수
        public var getLikes: Int {
          get {
            resultMap["getLikes"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "getLikes")
          }
        }

        /// 싫어요 수
        public var getUnLikes: Int {
          get {
            resultMap["getUnLikes"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "getUnLikes")
          }
        }

        /// 좋아요 상태
        public var isLike: Bool {
          get {
            resultMap["isLike"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isLike")
          }
        }

        /// 싫어요 상태
        public var isUnLike: Bool {
          get {
            resultMap["isUnLike"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isUnLike")
          }
        }

        /// 댓글
        public var comments: [Comment?]? {
          get {
            (resultMap["comments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Comment?] in value.map { (value: ResultMap?) -> Comment? in value.flatMap { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, forKey: "comments")
          }
        }

      }

      public static let possibleTypes: [String] = ["reviewRoom"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("review", type: .nonNull(.list(.nonNull(.object(Review.selections))))),
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

      /// PK
      public var id: Int {
        get {
          resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// 생성날짜
      public var createdAt: String {
        get {
          resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      /// 수정날짜
      public var updatedAt: String {
        get {
          resultMap["updatedAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }

      /// 해당리뷰
      public var review: [Review] {
        get {
          (resultMap["review"] as! [ResultMap]).map { (value: ResultMap) -> Review in Review(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Review) -> ResultMap in value.resultMap }, forKey: "review")
        }
      }

    }

    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("searchReviewRoom", arguments: ["roomId": GraphQLVariable("id")], type: .object(SearchReviewRoom.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var searchReviewRoom: SearchReviewRoom? {
      get {
        (resultMap["searchReviewRoom"] as? ResultMap).flatMap { SearchReviewRoom(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "searchReviewRoom")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query post($id: Int!) {
      searchReviewRoom(roomId: $id) {
        __typename
        id
        createdAt
        updatedAt
        review {
          __typename
          id
          createdAt
          updatedAt
          title
          content
          upload
          userId
          placeId
          getLikes
          getUnLikes
          isLike
          isUnLike
          comments {
            __typename
            id
            userId
            createdAt
            updatedAt
            payload
          }
        }
      }
    }
    """

  public let operationName: String = "post"

  public let operationIdentifier: String? = "e7b6019f627a898ecca592f3a18dcbb5a4ac116eea7feca11af08017deaff7fb"

  public var id: Int

  public var variables: GraphQLMap? {
    ["id": id]
  }

}

// MARK: - LikeReviewToggleMutation

public final class LikeReviewToggleMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(id: Int) {
    self.id = id
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(recommendEvent: RecommendEvent? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "recommendEvent": recommendEvent.flatMap { (value: RecommendEvent) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct RecommendEvent: GraphQLSelectionSet {

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
        GraphQLField("recommendEvent", arguments: ["reviewId": GraphQLVariable("id"), "like": true], type: .object(RecommendEvent.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    /// --- 추천기능 구현 ---
    ///
    /// like Then TRUE - 해당 게시글 추천
    ///
    /// like Then False - 해당 게시글 비추천
    public var recommendEvent: RecommendEvent? {
      get {
        (resultMap["recommendEvent"] as? ResultMap).flatMap { RecommendEvent(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "recommendEvent")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation likeReviewToggle($id: Int!) {
      recommendEvent(reviewId: $id, like: true) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "likeReviewToggle"

  public let operationIdentifier: String? = "018684cb8e48f4447c07a6b74079e987f56f5716050055dd552741945b769fc8"

  public var id: Int

  public var variables: GraphQLMap? {
    ["id": id]
  }

}

// MARK: - UnlikeReviewToggleMutation

public final class UnlikeReviewToggleMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(id: Int) {
    self.id = id
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(recommendEvent: RecommendEvent? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "recommendEvent": recommendEvent.flatMap { (value: RecommendEvent) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct RecommendEvent: GraphQLSelectionSet {

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
        GraphQLField("recommendEvent", arguments: ["reviewId": GraphQLVariable("id"), "like": false], type: .object(RecommendEvent.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    /// --- 추천기능 구현 ---
    ///
    /// like Then TRUE - 해당 게시글 추천
    ///
    /// like Then False - 해당 게시글 비추천
    public var recommendEvent: RecommendEvent? {
      get {
        (resultMap["recommendEvent"] as? ResultMap).flatMap { RecommendEvent(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "recommendEvent")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation unlikeReviewToggle($id: Int!) {
      recommendEvent(reviewId: $id, like: false) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "unlikeReviewToggle"

  public let operationIdentifier: String? = "12b468a2e85613a416cb3a325662de65635261bcea06aa9aa8b248116f9d25a8"

  public var id: Int

  public var variables: GraphQLMap? {
    ["id": id]
  }

}

// MARK: - ReviewLikeStatusQuery

public final class ReviewLikeStatusQuery: GraphQLQuery {

  // MARK: Lifecycle

  public init(id: Int? = nil) {
    self.id = id
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(searchReview: [SearchReview]) {
      self.init(unsafeResultMap: ["__typename": "Query", "searchReview": searchReview.map { (value: SearchReview) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct SearchReview: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(getLikes: Int, getUnLikes: Int, isLike: Bool, isUnLike: Bool) {
        self.init(unsafeResultMap: ["__typename": "Review", "getLikes": getLikes, "getUnLikes": getUnLikes, "isLike": isLike, "isUnLike": isUnLike])
      }

      // MARK: Public

      public static let possibleTypes: [String] = ["Review"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("getLikes", type: .nonNull(.scalar(Int.self))),
          GraphQLField("getUnLikes", type: .nonNull(.scalar(Int.self))),
          GraphQLField("isLike", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("isUnLike", type: .nonNull(.scalar(Bool.self))),
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

      /// 좋아요 수
      public var getLikes: Int {
        get {
          resultMap["getLikes"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "getLikes")
        }
      }

      /// 싫어요 수
      public var getUnLikes: Int {
        get {
          resultMap["getUnLikes"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "getUnLikes")
        }
      }

      /// 좋아요 상태
      public var isLike: Bool {
        get {
          resultMap["isLike"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isLike")
        }
      }

      /// 싫어요 상태
      public var isUnLike: Bool {
        get {
          resultMap["isUnLike"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isUnLike")
        }
      }
    }

    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("searchReview", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.list(.nonNull(.object(SearchReview.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    /// id -  PK
    ///
    /// title - 리뷰명(Startwith)
    ///
    /// category - 카테고리
    ///
    /// lastId - Pagination처리 변수
    public var searchReview: [SearchReview] {
      get {
        (resultMap["searchReview"] as! [ResultMap]).map { (value: ResultMap) -> SearchReview in SearchReview(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: SearchReview) -> ResultMap in value.resultMap }, forKey: "searchReview")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query reviewLikeStatus($id: Int) {
      searchReview(id: $id) {
        __typename
        getLikes
        getUnLikes
        isLike
        isUnLike
      }
    }
    """

  public let operationName: String = "reviewLikeStatus"

  public let operationIdentifier: String? = "413c3bf8392d04df96b92a4c889a8db0120e25df3f979b36017974ae07d6ff16"

  public var id: Int?

  public var variables: GraphQLMap? {
    ["id": id]
  }

}

// MARK: - SearchPlaceQuery

public final class SearchPlaceQuery: GraphQLQuery {

  // MARK: Lifecycle

  public init(title: String, category: String? = nil, lastID: Int? = nil) {
    self.title = title
    self.category = category
    self.lastID = lastID
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(searchPlace: [SearchPlace]) {
      self.init(unsafeResultMap: ["__typename": "Query", "searchPlace": searchPlace.map { (value: SearchPlace) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct SearchPlace: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(id: Int, createdAt: String, updatedAt: String, title: String, address: String, zipCode: Int? = nil, x: Double, y: Double, category: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Place", "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "title": title, "address": address, "zipCode": zipCode, "x": x, "y": y, "category": category])
      }

      // MARK: Public

      public static let possibleTypes: [String] = ["Place"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("address", type: .nonNull(.scalar(String.self))),
          GraphQLField("zipCode", type: .scalar(Int.self)),
          GraphQLField("x", type: .nonNull(.scalar(Double.self))),
          GraphQLField("y", type: .nonNull(.scalar(Double.self))),
          GraphQLField("category", type: .scalar(String.self)),
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

      /// PK
      public var id: Int {
        get {
          resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// 생성날짜
      public var createdAt: String {
        get {
          resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      /// 수정날짜
      public var updatedAt: String {
        get {
          resultMap["updatedAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }

      /// 제목
      public var title: String {
        get {
          resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// 주소
      public var address: String {
        get {
          resultMap["address"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "address")
        }
      }

      /// 우편번호
      public var zipCode: Int? {
        get {
          resultMap["zipCode"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "zipCode")
        }
      }

      /// x 좌표
      public var x: Double {
        get {
          resultMap["x"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "x")
        }
      }

      /// y 좌표
      public var y: Double {
        get {
          resultMap["y"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "y")
        }
      }

      /// 카테고리
      public var category: String? {
        get {
          resultMap["category"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "category")
        }
      }
    }

    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("searchPlace", arguments: ["title": GraphQLVariable("title"), "category": GraphQLVariable("category"), "lastId": GraphQLVariable("lastID")], type: .nonNull(.list(.nonNull(.object(SearchPlace.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    /// ---검색된 장소들을 보여줌---
    ///
    /// title : 검색 할 장소이름(StartWith)
    ///
    /// category : 검색할 카테고리 분류
    ///
    /// lastId : 페이징처리를 위한 변수이며, 마지막으로 조회했던 Place의 ID
    public var searchPlace: [SearchPlace] {
      get {
        (resultMap["searchPlace"] as! [ResultMap]).map { (value: ResultMap) -> SearchPlace in SearchPlace(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: SearchPlace) -> ResultMap in value.resultMap }, forKey: "searchPlace")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query searchPlace($title: String!, $category: String, $lastID: Int) {
      searchPlace(title: $title, category: $category, lastId: $lastID) {
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

  public let operationIdentifier: String? = "a97d11151162da16fc32dccdc23a540a9660d08cccb7d29f93f5b8ce77913e74"

  public var title: String
  public var category: String?
  public var lastID: Int?

  public var variables: GraphQLMap? {
    ["title": title, "category": category, "lastID": lastID]
  }

}

// MARK: - SearchReviewQuery

public final class SearchReviewQuery: GraphQLQuery {

  // MARK: Lifecycle

  public init(title: String? = nil, category: String? = nil, lastID: Int? = nil) {
    self.title = title
    self.category = category
    self.lastID = lastID
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(searchReview: [SearchReview]) {
      self.init(unsafeResultMap: ["__typename": "Query", "searchReview": searchReview.map { (value: SearchReview) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct SearchReview: GraphQLSelectionSet {

      // MARK: Lifecycle

      public init(unsafeResultMap: ResultMap) {
        resultMap = unsafeResultMap
      }

      public init(id: Int, createdAt: String, updatedAt: String, title: String, content: String, upload: String, userId: Int, placeId: Int? = nil, getLikes: Int, getUnLikes: Int, isLike: Bool, isUnLike: Bool, user: User, comments: [Comment?]? = nil, errorCode: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Review", "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "title": title, "content": content, "upload": upload, "userId": userId, "placeId": placeId, "getLikes": getLikes, "getUnLikes": getUnLikes, "isLike": isLike, "isUnLike": isUnLike, "user": user.resultMap, "comments": comments.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, "errorCode": errorCode])
      }

      // MARK: Public

      public struct User: GraphQLSelectionSet {

        // MARK: Lifecycle

        public init(unsafeResultMap: ResultMap) {
          resultMap = unsafeResultMap
        }

        public init(id: Int) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id])
        }

        // MARK: Public

        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
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
      }

      public struct Comment: GraphQLSelectionSet {

        // MARK: Lifecycle

        public init(unsafeResultMap: ResultMap) {
          resultMap = unsafeResultMap
        }

        public init(id: Int, createdAt: String, updatedAt: String, payload: String, reviewId: Int) {
          self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "payload": payload, "reviewId": reviewId])
        }

        // MARK: Public

        public static let possibleTypes: [String] = ["Comment"]

        public static var selections: [GraphQLSelection] {
          [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("payload", type: .nonNull(.scalar(String.self))),
            GraphQLField("reviewId", type: .nonNull(.scalar(Int.self))),
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

        /// PK
        public var id: Int {
          get {
            resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// 생성날짜
        public var createdAt: String {
          get {
            resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        /// 수정날짜
        public var updatedAt: String {
          get {
            resultMap["updatedAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updatedAt")
          }
        }

        /// 댓글내용
        public var payload: String {
          get {
            resultMap["payload"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "payload")
          }
        }

        /// 해당리뷰ID
        public var reviewId: Int {
          get {
            resultMap["reviewId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "reviewId")
          }
        }
      }

      public static let possibleTypes: [String] = ["Review"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("upload", type: .nonNull(.scalar(String.self))),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("placeId", type: .scalar(Int.self)),
          GraphQLField("getLikes", type: .nonNull(.scalar(Int.self))),
          GraphQLField("getUnLikes", type: .nonNull(.scalar(Int.self))),
          GraphQLField("isLike", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("isUnLike", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
          GraphQLField("comments", type: .list(.object(Comment.selections))),
          GraphQLField("errorCode", type: .scalar(Int.self)),
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

      /// PK
      public var id: Int {
        get {
          resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// 생성날짜
      public var createdAt: String {
        get {
          resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      /// 수정날짜
      public var updatedAt: String {
        get {
          resultMap["updatedAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }

      /// 제목
      public var title: String {
        get {
          resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// 내용
      public var content: String {
        get {
          resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      /// 사진
      public var upload: String {
        get {
          resultMap["upload"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "upload")
        }
      }

      /// 생성유저ID
      public var userId: Int {
        get {
          resultMap["userId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "userId")
        }
      }

      /// 장소 PK
      public var placeId: Int? {
        get {
          resultMap["placeId"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "placeId")
        }
      }

      /// 좋아요 수
      public var getLikes: Int {
        get {
          resultMap["getLikes"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "getLikes")
        }
      }

      /// 싫어요 수
      public var getUnLikes: Int {
        get {
          resultMap["getUnLikes"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "getUnLikes")
        }
      }

      /// 좋아요 상태
      public var isLike: Bool {
        get {
          resultMap["isLike"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isLike")
        }
      }

      /// 싫어요 상태
      public var isUnLike: Bool {
        get {
          resultMap["isUnLike"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isUnLike")
        }
      }

      /// 해당 유저정보
      public var user: User {
        get {
          User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      /// 댓글
      public var comments: [Comment?]? {
        get {
          (resultMap["comments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Comment?] in value.map { (value: ResultMap?) -> Comment? in value.flatMap { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, forKey: "comments")
        }
      }

      /// 에러코드
      public var errorCode: Int? {
        get {
          resultMap["errorCode"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "errorCode")
        }
      }

    }

    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      [
        GraphQLField("searchReview", arguments: ["title": GraphQLVariable("title"), "category": GraphQLVariable("category"), "lastId": GraphQLVariable("lastID")], type: .nonNull(.list(.nonNull(.object(SearchReview.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    /// id -  PK
    ///
    /// title - 리뷰명(Startwith)
    ///
    /// category - 카테고리
    ///
    /// lastId - Pagination처리 변수
    public var searchReview: [SearchReview] {
      get {
        (resultMap["searchReview"] as! [ResultMap]).map { (value: ResultMap) -> SearchReview in SearchReview(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: SearchReview) -> ResultMap in value.resultMap }, forKey: "searchReview")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query searchReview($title: String, $category: String, $lastID: Int) {
      searchReview(title: $title, category: $category, lastId: $lastID) {
        __typename
        id
        createdAt
        updatedAt
        title
        content
        upload
        userId
        placeId
        getLikes
        getUnLikes
        isLike
        isUnLike
        user {
          __typename
          id
        }
        comments {
          __typename
          id
          createdAt
          updatedAt
          payload
          reviewId
        }
        errorCode
      }
    }
    """

  public let operationName: String = "searchReview"

  public let operationIdentifier: String? = "863d54afe03a509a7507a65632f9ba036e8cdda6f2b61e4a0aee32a2cf11333d"

  public var title: String?
  public var category: String?
  public var lastID: Int?

  public var variables: GraphQLMap? {
    ["title": title, "category": category, "lastID": lastID]
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

      public init(id: Int, userName: String, nickName: String, email: String, avatar: String? = nil, bio: String? = nil, gender: String? = nil, ageRanger: String? = nil, createdAt: String, updatedAt: String? = nil, platformType: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "userName": userName, "nickName": nickName, "email": email, "avatar": avatar, "bio": bio, "gender": gender, "ageRanger": ageRanger, "createdAt": createdAt, "updatedAt": updatedAt, "platformType": platformType])
      }

      // MARK: Public

      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("userName", type: .nonNull(.scalar(String.self))),
          GraphQLField("nickName", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .scalar(String.self)),
          GraphQLField("bio", type: .scalar(String.self)),
          GraphQLField("gender", type: .scalar(String.self)),
          GraphQLField("ageRanger", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("platformType", type: .scalar(String.self)),
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

      public var userName: String {
        get {
          resultMap["userName"]! as! String
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

      public var createdAt: String {
        get {
          resultMap["createdAt"]! as! String
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

      public var platformType: String? {
        get {
          resultMap["platformType"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "platformType")
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
        platformType
      }
    }
    """

  public let operationName: String = "seeProfile"

  public let operationIdentifier: String? = "82fedfbfbf51c5b207939d62c9cc80766e7d08d6ab52521b7f2c975166424550"

  public var userName: String

  public var variables: GraphQLMap? {
    ["userName": userName]
  }

}

// MARK: - UpdatePlaceMutation

public final class UpdatePlaceMutation: GraphQLMutation {

  // MARK: Lifecycle

  public init(place: [UpdatePlaceInput]?) {
    self.place = place
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(updatePlace: UpdatePlace? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updatePlace": updatePlace.flatMap { (value: UpdatePlace) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct UpdatePlace: GraphQLSelectionSet {

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
        GraphQLField("updatePlace", arguments: ["place": GraphQLVariable("place")], type: .object(UpdatePlace.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    /// UpdatePlaceInput - Place JSON DATA
    public var updatePlace: UpdatePlace? {
      get {
        (resultMap["updatePlace"] as? ResultMap).flatMap { UpdatePlace(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updatePlace")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation updatePlace($place: [UpdatePlaceInput!]) {
      updatePlace(place: $place) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "updatePlace"

  public let operationIdentifier: String? = "6d2ab91145d89624619d89a98b59e6ea625145286cb437ffc49bdc6dc363fe8c"

  public var place: [UpdatePlaceInput]?

  public var variables: GraphQLMap? {
    ["place": place]
  }

}

// MARK: - NickNameValidationQuery

public final class NickNameValidationQuery: GraphQLQuery {

  // MARK: Lifecycle

  public init(nickName: String? = nil) {
    self.nickName = nickName
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(userCheck: UserCheck? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "userCheck": userCheck.flatMap { (value: UserCheck) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct UserCheck: GraphQLSelectionSet {

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
        GraphQLField("userCheck", arguments: ["nickName": GraphQLVariable("nickName")], type: .object(UserCheck.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var userCheck: UserCheck? {
      get {
        (resultMap["userCheck"] as? ResultMap).flatMap { UserCheck(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "userCheck")
      }
    }

  }

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

  public var variables: GraphQLMap? {
    ["nickName": nickName]
  }

}

// MARK: - EmailValidationQuery

public final class EmailValidationQuery: GraphQLQuery {

  // MARK: Lifecycle

  public init(email: String? = nil) {
    self.email = email
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(userCheck: UserCheck? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "userCheck": userCheck.flatMap { (value: UserCheck) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct UserCheck: GraphQLSelectionSet {

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
        GraphQLField("userCheck", arguments: ["email": GraphQLVariable("email")], type: .object(UserCheck.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var userCheck: UserCheck? {
      get {
        (resultMap["userCheck"] as? ResultMap).flatMap { UserCheck(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "userCheck")
      }
    }

  }

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

  public var variables: GraphQLMap? {
    ["email": email]
  }

}

// MARK: - UserNameValidationQuery

public final class UserNameValidationQuery: GraphQLQuery {

  // MARK: Lifecycle

  public init(userName: String? = nil) {
    self.userName = userName
  }

  // MARK: Public

  public struct Data: GraphQLSelectionSet {

    // MARK: Lifecycle

    public init(unsafeResultMap: ResultMap) {
      resultMap = unsafeResultMap
    }

    public init(userCheck: UserCheck? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "userCheck": userCheck.flatMap { (value: UserCheck) -> ResultMap in value.resultMap }])
    }

    // MARK: Public

    public struct UserCheck: GraphQLSelectionSet {

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
        GraphQLField("userCheck", arguments: ["userName": GraphQLVariable("userName")], type: .object(UserCheck.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public var userCheck: UserCheck? {
      get {
        (resultMap["userCheck"] as? ResultMap).flatMap { UserCheck(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "userCheck")
      }
    }

  }

  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query userNameValidation($userName: String) {
      userCheck(userName: $userName) {
        __typename
        ok
        error
      }
    }
    """

  public let operationName: String = "userNameValidation"

  public let operationIdentifier: String? = "eab2376bb0f5027aa258a26586fe7f61f811ccedc2a1423575ccc9e9d3130a59"

  public var userName: String?

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

      public init(ok: Bool? = nil, error: Int? = nil, token: Token? = nil) {
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
          GraphQLField("error", type: .scalar(Int.self)),
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

      public var error: Int? {
        get {
          resultMap["error"] as? Int
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

  public var variables: GraphQLMap? {
    ["userName": userName, "password": password]
  }

}
