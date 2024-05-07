//
//  MainViewModel.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-04-25.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    
    @Published var phase: Phase = .notRequested
    @Published var animes: [Animes] = []

    enum Action{
        case loading
        case goToDetail
    }
    
    private var service: AnimeNetworkService
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: AnimeNetworkService) {
        self.service = service
    }
    
    
    func send(action: Action) {
        switch action {
        case .loading:
            phase = .loading
            
            service.getAnimes()
                .sink { [weak self] completion in
                    if case .failure = completion {
                        self?.phase = .fail
                    }
                } receiveValue: { [weak self] data in
                    self?.phase = .success
                    self?.animes = data
                }.store(in: &subscriptions)

        case .goToDetail:
            break
        }
        
    }


}