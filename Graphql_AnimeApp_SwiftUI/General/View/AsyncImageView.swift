//
//  AsyncImageView.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-05-15.
//

import SwiftUI

struct AsyncImageView: View {
    var url: String
    var contentMode: ContentMode
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image.resizable()
            } else if phase.error != nil {
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .frame(width: 50, height: 50)
            } else {
                LoadingView()
                    .foregroundStyle(.white)
            }
        }
        .aspectRatio(contentMode: contentMode)
    }
}

#Preview {
    AsyncImageView(url: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx60-N28VFNCZyvhI.png", contentMode: .fill)
}
