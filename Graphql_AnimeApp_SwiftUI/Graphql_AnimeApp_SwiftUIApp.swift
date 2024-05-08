//
//  Graphql_AnimeApp_SwiftUIApp.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-04-25.
//

import SwiftUI

@main
struct Graphql_AnimeApp_SwiftUIApp: App {
//    AnimeNetworkService
    @StateObject var service: AnimeNetworkService = AnimeNetworkService(networking: AnimeNetwork())

    var body: some Scene {
        WindowGroup {
            MainView(viewModel: .init(service: service))
                .environmentObject(service)
        }
    }
}
