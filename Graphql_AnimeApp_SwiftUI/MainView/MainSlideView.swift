//
//  MainSlideView.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-05-15.
//

import SwiftUI

struct MainSlideView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var onClickHandler: ((Anime)->Void)?
    @State private var index = 0
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<viewModel.animesForMainSlide.count, id: \.self) { index in
                let anime = viewModel.animesForMainSlide[index]
                AnimeCell(anime: anime)
                    .onTapGesture{
                        onClickHandler?(anime)
                    }
                    .id(index)
                    .frame(width: 200, height: 300)
                    .background(.gray)
                    .foregroundStyle(.white)
                    .clipShape( RoundedRectangle(cornerRadius: 8) )
            }
        }
    }
}

struct AnimeCell: View {
    var anime: Anime
    
    var body: some View {
        ZStack {
            AsyncImageView(url: anime.coverImage?.large ?? "", contentMode: .fill)
            
            LinearGradient(gradient: Gradient(colors: [ Color.black.opacity(0.1), Color.black.opacity(0.9)]), startPoint: .center, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 5) {
                Spacer()
                
                Text("\(anime.title?.romaji ?? "")")
                    .font(.system(size: 12, weight: .medium))
                    .padding(.horizontal, 10)
                
                HStack() {
                    ForEach(anime.genres.indices, id: \.self) { index in
                        if index < 4 {
                            Text(anime.genres[index] ?? "")
                                .font(.system(size: 9, weight: .light))
                        }
                    }
                }
            }
            .padding(.bottom, 10)
        }
    }
}

#Preview {
    MainSlideView(viewModel: .init(service: AnimeNetworkService(networking: AnimeNetwork())))
}
