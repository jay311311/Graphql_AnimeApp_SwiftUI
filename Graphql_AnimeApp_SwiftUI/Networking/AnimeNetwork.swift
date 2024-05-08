//
//  AnimeNetwork.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-04-25.
//

import Foundation
import ChargeTripAPI
import Apollo


class AnimeNetwork {
    
    let apolloClient = ApolloClient(url: URL(string: "https://graphql.anilist.co/graphql")!)
    
    func fetchData(completion: @escaping (Result<AnimesData, ServiceError>) -> Void) {
        apolloClient.fetch(query: AnimeQuery()) { result in
            switch result {
            case let .success(graphQLResult):
                if let media = graphQLResult.data?.page {
                    completion(.success(media))
                } else {
                    completion(.failure(.emptyValue))
                }
            case let .failure(error):
                completion(.failure(.error(error)))
            }
        }
    }
    
}
