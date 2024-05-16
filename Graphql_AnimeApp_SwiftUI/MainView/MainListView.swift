//
//  MainListView.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-05-15.
//

import SwiftUI

struct MainListView: View {
    @ObservedObject var viewModel: MainViewModel
    var onClickHandler: ((Anime)->Void)?
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]) {
            ForEach(viewModel.animesForList, id: \.self) { item in
                ZStack {
                    AsyncImageView(url: item.coverImage?.large ?? "", contentMode: .fill)
                                         
                    LinearGradient(gradient: Gradient(colors: [ Color.black.opacity(0.1), Color.black.opacity(0.9)]), startPoint: .center, endPoint: .bottom)
                        .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        Text(item.title?.romaji ?? "")
                            .font(.system(size: 11))
                            .foregroundStyle(.white)
                            .padding(.bottom,10)
                    }
                }
                .frame(width: 100, height: 150)
                .onTapGesture {
                    onClickHandler?(item)
                }
            }
        }
    }
    
}

#Preview {
    MainListView(viewModel: .init(service: AnimeNetworkService(networking: AnimeNetwork())))
}
