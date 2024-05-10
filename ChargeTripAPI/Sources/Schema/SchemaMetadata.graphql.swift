// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == ChargeTripAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == ChargeTripAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == ChargeTripAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == ChargeTripAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return ChargeTripAPI.Objects.Query
    case "Page": return ChargeTripAPI.Objects.Page
    case "Media": return ChargeTripAPI.Objects.Media
    case "FuzzyDate": return ChargeTripAPI.Objects.FuzzyDate
    case "MediaTitle": return ChargeTripAPI.Objects.MediaTitle
    case "MediaCoverImage": return ChargeTripAPI.Objects.MediaCoverImage
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
