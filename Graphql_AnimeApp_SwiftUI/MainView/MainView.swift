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
    
    var body: some View {
        NavigationStack{
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
    }
    
    var AnimeList: some View {
        ScrollView{
            ForEach(viewModel.animes, id: \.self) { anime in
                if !anime.synonyms.isEmpty {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: 250, height: 100)
                        VStack {
                            AsyncImage(url: URL(string: anime.bannerImage ?? "")) { image in
                                image.resizable()
                                Text("\(anime.synonyms[0] ?? "")")
                                    .font(.system(size: 13, weight: .bold))
                            } placeholder: {
                                PlaceHolderView()
                            }
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 100)
                        }
                    }
                    .presentationCornerRadius(5)
                    .foregroundStyle(.blue)
                }
            }
        }
    }
}

#Preview {
    MainView(viewModel: .init(service: AnimeNetworkService(networking: AnimeNetwork())))
}
