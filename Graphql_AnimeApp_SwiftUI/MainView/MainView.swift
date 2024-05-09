//
//  MainView.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-05-06.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var service: AnimeNetworkService
    @ObservedObject var viewModel: MainViewModel
    
    @State var path: [DetailViewContent] = []
    
    var body: some View {
        switch viewModel.phase {
        case .notRequested:
            PlaceHolderView()
                .onAppear(){
                    viewModel.send(action: .loading)
                }
        case .loading:
            LoadingView()
        case .success:
            AnimeList
        case .fail:
            ErrorView()
        }
    }
    
    var AnimeList: some View {
        NavigationStack(path: $path) {
            List(viewModel.animes, id: \.self) { anime in
                if !anime.synonyms.isEmpty && anime.bannerImage != nil {
                    AnimeCell(anime: anime)
                        .onTapGesture{
                            path.append(DetailViewContent(anime: anime))
                        }
                        .frame(height: 140)
                        .background(.gray)
                        .foregroundStyle(.white)
                        .clipShape( RoundedRectangle(cornerRadius: 8) )
                }
            }
            .navigationTitle("Animes")
            .navigationDestination(for: DetailViewContent.self) { detail in
                DetailView(viewModel: .init(anime: detail.anime))
            }
        }
    }
}

struct AnimeCell: View {
    var anime: Anime
    
    var body: some View {
        return LazyVStack(alignment: .center){
            AsyncImage(url: URL(string: anime.bannerImage ?? "")) { image in
                image.resizable()
            } placeholder: {
                LoadingView()
                    .foregroundStyle(.white)
            }
            .aspectRatio(contentMode: .fill)
            .frame(width: 250, height: 100)
            VStack(spacing: 0) {
                Text("\(anime.synonyms[0] ?? "")")
                    .font(.system(size: 12, weight: .medium))
                HStack() {
                    ForEach(anime.genres.indices, id: \.self) { index in
                        if index < 4 {
                            Text(anime.genres[index] ?? "")
                                .font(.system(size: 9, weight: .light))
                        }
                    }
                }
                Spacer()
            }
            .frame(height: 40)
        }
    }
}

#Preview {
    MainView(viewModel: .init(service: AnimeNetworkService(networking: AnimeNetwork())))
}
