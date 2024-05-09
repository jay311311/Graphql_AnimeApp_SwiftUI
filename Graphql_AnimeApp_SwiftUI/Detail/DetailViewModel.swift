//
//  DetailViewModel.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-05-09.
//

import Foundation
import Combine


class DetailViewModel: ObservableObject {
    @Published var anime: Anime
    
    init(anime: Anime) {
        self.anime = anime
    }
}
