//
//  AnimeNetworkService.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-05-06.
//

import Foundation
import Combine
import ChargeTripAPI

enum ServiceError: Error {
    case error(Error)
    case emptyValue
}

protocol AnimeNetworkServiceType {
    func getAnimes() -> AnyPublisher<[Anime], ServiceError>
}


class AnimeNetworkService: AnimeNetworkServiceType, ObservableObject {
    
    private var networking: AnimeNetwork
    
    init(networking: AnimeNetwork) {
        self.networking = networking
    }
    
    func getAnimes() -> AnyPublisher<[Anime], ServiceError> {
        Future { [weak self] promise in
            self?.networking.fetchData { result in
                switch result {
                case let .success(anime):
                    let animes = Animes(animes: anime).animes
                    let notNillAnimes = animes.compactMap { $0 }
                    promise(.success(notNillAnimes))
                case let .failure(error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
