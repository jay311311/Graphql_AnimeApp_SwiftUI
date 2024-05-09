//
//  DetailView.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-05-09.
//

import SwiftUI
import Combine

struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel

    var body: some View {
        Text("Hello, \(viewModel.anime.id)")
    }
}

#Preview {
    DetailView(viewModel: .init(anime: Anime(id: 0, genres: [], synonyms: [])))
}
 
