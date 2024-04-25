//
//  AnimeNetwork.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-04-25.
//

import Foundation
import Apollo

class AnimeNetwork {
    static let shared =  AnimeNetwork()
            
    private init() { }
    
    let apolloClient = ApolloClient(url: URL(string: "https://graphql.anilist.co/graphql")!)
    

}
