//
//  Graphql_AnimeApp_SwiftUIApp.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-04-25.
//

import SwiftUI

@main
struct Graphql_AnimeApp_SwiftUIApp: App {
    @StateObject var animeViewModel: AnimeListViewModel = AnimeListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(animeViewModel)
        }
    }
}
