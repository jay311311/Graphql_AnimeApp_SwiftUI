//
//  DetailView.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-05-09.
//

import SwiftUI
import Combine

struct DetailView: View {
    @Environment(\.openURL) var openURL
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        ZStack{
            ScrollView{
                AsyncImage(url: URL(string: viewModel.anime.bannerImage ?? "")) { image in
                    image.resizable()
                    image.resizable()
                    image.resizable()
                } placeholder: {
                    LoadingView()
                        .foregroundStyle(.white)
                }
                .aspectRatio(contentMode: .fit)
                
                genres
                    .padding(.leading, 10)
                    .padding(.top, 10)
                
                information
                    .padding(.all, 20)
                
                description
                    .padding(.horizontal,10)
            }
            .navigationTitle(viewModel.anime.synonyms[0] ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .safeAreaInset(edge: .bottom, content: {
                Button {
                    if let url  =  viewModel.anime.siteUrl {
                        openURL(URL(string: url)!)
                    }
                } label: {
                    Text("Go to Site")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .cornerRadius(10)
                }
            })
        }
    }
    
    var genres: some View {
        HStack {
            ForEach(viewModel.anime.genres.indices, id: \.self) { index in
                if index < 4 {
                    Text(viewModel.anime.genres[index] ?? "")
                        .font(.system(size: 10, weight: .medium))
                        .padding(.all, 4)
                        .background(.cyan)
                        .foregroundStyle(.white)
                        .cornerRadius(5)
                }
            }
            Spacer()
        }
    }
    
    var information: some View {
        // 소요 시간 (duration)
        // 평점. (averageScore)
        // 포맷 (type)
        // 연도 (seasonYear)
        GroupBox{
            HStack {
                infoCell(title: "Type", info: viewModel.anime.type ?? "-")
                infoCell(title: "Score", score:  viewModel.anime.averageScore)
                infoCell(title: "Year", score: viewModel.anime.seasonYear)
                infoCell(title: "Time", score: viewModel.anime.duration )
            }
        }
    }
    
    var description: some View {
        Text("\(viewModel.anime.description ?? "")")
            .font(.system(size: 13))
    }
}

struct infoCell: View {
    var title: String
    var info: String = "-"
    var score: Int?
    
    var body: some View {
        VStack{
            Text(title)
                .font(.system(size: 13, weight: .bold))
            Divider()
            Text( (score != nil) ?  "\(score!)": info)
                .font(.system(size: 11))
        }
    }
}

#Preview {
    DetailView(viewModel: .init(anime: Anime(id: 0, type: "ANIME", format: "TV", status: "FINISHED", description: "It is the dark century and the people are suffering under the rule of the devil, Vandel, who is able to manipulate monsters. The Vandel Busters are a group of people who hunt these devils, and among them, the Zenon Squad is known to be the strongest busters on the continent. A young boy, Beet, dreams of joining the Zenon Squad. However, one day, as a result of Beet's fault, the Zenon squad was defeated by the devil, Beltose. The five dying busters sacrificed their life power into their five weapons, Saiga. After giving their weapons to Beet, they passed away. Years have passed since then and the young Vandel Buster, Beet, begins his adventure to carry out the Zenon Squad's will to put an end to the dark century. ", season: "FALL", seasonYear: 2004, seasonInt: 44, episodes: 52, duration: 23, countryOfOrigin: "JP", isLicensed: true, source: "MANGA", updatedAt: 1715031745, bannerImage: "https://s4.anilist.co/file/anilistcdn/media/anime/banner/7-hjjlCe3yO7lO.jpg", genres: ["Action", "Drama", "Mystery", "Supernatural"], synonyms: ["ウイッチハンターロビン", "WHR"], averageScore:82)))
}

