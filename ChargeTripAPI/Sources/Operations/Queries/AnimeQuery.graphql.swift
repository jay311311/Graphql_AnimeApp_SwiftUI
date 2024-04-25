// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AnimeQuery: GraphQLQuery {
  public static let operationName: String = "Anime"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Anime { Page { __typename media { __typename id idMal type format status description season seasonYear seasonInt episodes duration countryOfOrigin isLicensed source updatedAt bannerImage genres synonyms averageScore meanScore popularity trending favourites isAdult siteUrl } pageInfo { __typename total perPage currentPage lastPage hasNextPage } } }"#
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
        .field("pageInfo", PageInfo?.self),
      ] }

      public var media: [Medium?]? { __data["media"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

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
          .field("season", GraphQLEnum<ChargeTripAPI.MediaSeason>?.self),
          .field("seasonYear", Int?.self),
          .field("seasonInt", Int?.self),
          .field("episodes", Int?.self),
          .field("duration", Int?.self),
          .field("countryOfOrigin", ChargeTripAPI.CountryCode?.self),
          .field("isLicensed", Bool?.self),
          .field("source", GraphQLEnum<ChargeTripAPI.MediaSource>?.self),
          .field("updatedAt", Int?.self),
          .field("bannerImage", String?.self),
          .field("genres", [String?]?.self),
          .field("synonyms", [String?]?.self),
          .field("averageScore", Int?.self),
          .field("meanScore", Int?.self),
          .field("popularity", Int?.self),
          .field("trending", Int?.self),
          .field("favourites", Int?.self),
          .field("isAdult", Bool?.self),
          .field("siteUrl", String?.self),
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
        /// The season the media was initially released in
        public var season: GraphQLEnum<ChargeTripAPI.MediaSeason>? { __data["season"] }
        /// The season year the media was initially released in
        public var seasonYear: Int? { __data["seasonYear"] }
        /// The year & season the media was initially released in
        public var seasonInt: Int? { __data["seasonInt"] }
        /// The amount of episodes the anime has when complete
        public var episodes: Int? { __data["episodes"] }
        /// The general length of each anime episode in minutes
        public var duration: Int? { __data["duration"] }
        /// Where the media was created. (ISO 3166-1 alpha-2)
        public var countryOfOrigin: ChargeTripAPI.CountryCode? { __data["countryOfOrigin"] }
        /// If the media is officially licensed or a self-published doujin release
        public var isLicensed: Bool? { __data["isLicensed"] }
        /// Source type the media was adapted from.
        public var source: GraphQLEnum<ChargeTripAPI.MediaSource>? { __data["source"] }
        /// When the media's data was last updated
        public var updatedAt: Int? { __data["updatedAt"] }
        /// The banner image of the media
        public var bannerImage: String? { __data["bannerImage"] }
        /// The genres of the media
        public var genres: [String?]? { __data["genres"] }
        /// Alternative titles of the media
        public var synonyms: [String?]? { __data["synonyms"] }
        /// A weighted average score of all the user's scores of the media
        public var averageScore: Int? { __data["averageScore"] }
        /// Mean score of all the user's scores of the media
        public var meanScore: Int? { __data["meanScore"] }
        /// The number of users with the media on their list
        public var popularity: Int? { __data["popularity"] }
        /// The amount of related activity in the past hour
        public var trending: Int? { __data["trending"] }
        /// The amount of user's who have favourited the media
        public var favourites: Int? { __data["favourites"] }
        /// If the media is intended only for 18+ adult audiences
        public var isAdult: Bool? { __data["isAdult"] }
        /// The url for the media page on the AniList website
        public var siteUrl: String? { __data["siteUrl"] }
      }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: ChargeTripAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { ChargeTripAPI.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("total", Int?.self),
          .field("perPage", Int?.self),
          .field("currentPage", Int?.self),
          .field("lastPage", Int?.self),
          .field("hasNextPage", Bool?.self),
        ] }

        /// The total number of items. Note: This value is not guaranteed to be accurate, do not rely on this for logic
        public var total: Int? { __data["total"] }
        /// The count on a page
        public var perPage: Int? { __data["perPage"] }
        /// The current page
        public var currentPage: Int? { __data["currentPage"] }
        /// The last page
        public var lastPage: Int? { __data["lastPage"] }
        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }
    }
  }
}
