//
//  AnimeListViewModel.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-04-25.
//

import Foundation
import ChargeTripAPI

class AnimeListViewModel: ObservableObject {
    
    init(){
        fetchData()
    }
    func fetchData() {
        AnimeNetwork.shared.apolloClient.fetch(query: AnimeQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let media = graphQLResult.data?.page?.media {
                    media.forEach { media in
                        print("Sucess \(media?.id)")
                    }
                }
               
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}
