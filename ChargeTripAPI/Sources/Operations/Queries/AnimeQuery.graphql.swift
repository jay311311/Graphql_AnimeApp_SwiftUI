// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AnimeQuery: GraphQLQuery {
  public static let operationName: String = "Anime"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Anime { Page { __typename media { __typename id idMal type format status description episodes duration bannerImage genres averageScore popularity isAdult siteUrl startDate { __typename year month day } title { __typename romaji english native userPreferred } coverImage { __typename extraLarge large medium color } } } }"#
    ))

  public init() {}

  public struct Data: ChargeTripAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { ChargeTripAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: ChargeTripAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { ChargeTripAPI.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("media", [Medium?]?.self),
      ] }

      public var media: [Medium?]? { __data["media"] }

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: ChargeTripAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { ChargeTripAPI.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("idMal", Int?.self),
          .field("type", GraphQLEnum<ChargeTripAPI.MediaType>?.self),
          .field("format", GraphQLEnum<ChargeTripAPI.MediaFormat>?.self),
          .field("status", GraphQLEnum<ChargeTripAPI.MediaStatus>?.self),
          .field("description", String?.self),
          .field("episodes", Int?.self),
          .field("duration", Int?.self),
          .field("bannerImage", String?.self),
          .field("genres", [String?]?.self),
          .field("averageScore", Int?.self),
          .field("popularity", Int?.self),
          .field("isAdult", Bool?.self),
          .field("siteUrl", String?.self),
          .field("startDate", StartDate?.self),
          .field("title", Title?.self),
          .field("coverImage", CoverImage?.self),
        ] }

        /// The id of the media
        public var id: Int { __data["id"] }
        /// The mal id of the media
        public var idMal: Int? { __data["idMal"] }
        /// The type of the media; anime or manga
        public var type: GraphQLEnum<ChargeTripAPI.MediaType>? { __data["type"] }
        /// The format the media was released in
        public var format: GraphQLEnum<ChargeTripAPI.MediaFormat>? { __data["format"] }
        /// The current releasing status of the media
        public var status: GraphQLEnum<ChargeTripAPI.MediaStatus>? { __data["status"] }
        /// Short description of the media's story and characters
        public var description: String? { __data["description"] }
        /// The amount of episodes the anime has when complete
        public var episodes: Int? { __data["episodes"] }
        /// The general length of each anime episode in minutes
        public var duration: Int? { __data["duration"] }
        /// The banner image of the media
        public var bannerImage: String? { __data["bannerImage"] }
        /// The genres of the media
        public var genres: [String?]? { __data["genres"] }
        /// A weighted average score of all the user's scores of the media
        public var averageScore: Int? { __data["averageScore"] }
        /// The number of users with the media on their list
        public var popularity: Int? { __data["popularity"] }
        /// If the media is intended only for 18+ adult audiences
        public var isAdult: Bool? { __data["isAdult"] }
        /// The url for the media page on the AniList website
        public var siteUrl: String? { __data["siteUrl"] }
        /// The first official release date of the media
        public var startDate: StartDate? { __data["startDate"] }
        /// The official titles of the media in various languages
        public var title: Title? { __data["title"] }
        /// The cover images of the media
        public var coverImage: CoverImage? { __data["coverImage"] }

        /// Page.Medium.StartDate
        ///
        /// Parent Type: `FuzzyDate`
        public struct StartDate: ChargeTripAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { ChargeTripAPI.Objects.FuzzyDate }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("year", Int?.self),
            .field("month", Int?.self),
            .field("day", Int?.self),
          ] }

          /// Numeric Year (2017)
          public var year: Int? { __data["year"] }
          /// Numeric Month (3)
          public var month: Int? { __data["month"] }
          /// Numeric Day (24)
          public var day: Int? { __data["day"] }
        }

        /// Page.Medium.Title
        ///
        /// Parent Type: `MediaTitle`
        public struct Title: ChargeTripAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { ChargeTripAPI.Objects.MediaTitle }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("romaji", String?.self),
            .field("english", String?.self),
            .field("native", String?.self),
            .field("userPreferred", String?.self),
          ] }

          /// The romanization of the native language title
          public var romaji: String? { __data["romaji"] }
          /// The official english title
          public var english: String? { __data["english"] }
          /// Official title in it's native language
          public var native: String? { __data["native"] }
          /// The currently authenticated users preferred title language. Default romaji for non-authenticated
          public var userPreferred: String? { __data["userPreferred"] }
        }

        /// Page.Medium.CoverImage
        ///
        /// Parent Type: `MediaCoverImage`
        public struct CoverImage: ChargeTripAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { ChargeTripAPI.Objects.MediaCoverImage }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("extraLarge", String?.self),
            .field("large", String?.self),
            .field("medium", String?.self),
            .field("color", String?.self),
          ] }

          /// The cover image url of the media at its largest size. If this size isn't available, large will be provided instead.
          public var extraLarge: String? { __data["extraLarge"] }
          /// The cover image url of the media at a large size
          public var large: String? { __data["large"] }
          /// The cover image url of the media at medium size
          public var medium: String? { __data["medium"] }
          /// Average #hex color of cover image
          public var color: String? { __data["color"] }
        }
      }
    }
  }
}
