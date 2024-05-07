//
//  MainView.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-05-06.
//

import SwiftUI

struct MainView: View {
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
                AsyncImage(url: URL(string: anime?.bannerImage ?? "")) { image in
                    image
                        .image?.resizable()
                        .scaledToFit()
                }
            }
        }
    }
}

#Preview {
    MainView(viewModel: .init(service: AnimeNetworkService(networking: AnimeNetwork())))
}
