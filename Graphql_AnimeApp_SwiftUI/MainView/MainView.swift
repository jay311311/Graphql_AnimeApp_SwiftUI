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
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    
    @State var path: [DetailViewContent] = []
    
    var body: some View {
        switch viewModel.phase {
        case .notRequested:
            PlaceHolderView()
                .onAppear() {
                    viewModel.send(action: .loading)
                }
        case .loading:
            LoadingView()
        case .success:
            NavigationStack(path: $path) {
                VStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Movie")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.leading, 20)
                            .padding(.top, 10)
                        ScrollViewReader { scrollView in
                            ScrollView(.horizontal, showsIndicators: false) {
                                MainSlideView(viewModel: viewModel) { anime in
                                    moveToDetail(anime: anime)
                                }
                                .padding(.horizontal, 20)
                            }
                            .frame(height: 300)
                            .onReceive(timer, perform: {  value in
                                let amount  = viewModel.animesForMainSlide.count
                                currentIndex = currentIndex < amount-1 ? currentIndex + 1 : amount
                                withAnimation {
                                    scrollView.scrollTo(currentIndex, anchor: .center)
                                }
                            })
                            Spacer()
                            
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("TV")
                            .padding(.horizontal, 20)
                            .font(.system(size: 20, weight: .bold))
                        ScrollView(.vertical, showsIndicators: false) {
                            MainListView(viewModel: viewModel) { anime in
                                moveToDetail(anime: anime)
                            }
                        }
                        .padding(.horizontal,20)
                    }
                }
                .navigationTitle("Animes")
                .navigationDestination(for: DetailViewContent.self) { detail in
                    DetailView(viewModel: .init(anime: detail.anime))
                }
            }
        case .fail:
            ErrorView()
        }
    }
    
    func moveToDetail(anime: Anime) {
        path.append(DetailViewContent(anime: anime))
    }
}

#Preview {
    MainView(viewModel: .init(service: AnimeNetworkService(networking: AnimeNetwork())))
}
