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
    func getAnimes() -> AnyPublisher<[Animes], ServiceError>
}


class AnimeNetworkService: AnimeNetworkServiceType {
    
    private var networking: AnimeNetwork
    
    init(networking: AnimeNetwork) {
        self.networking = networking
    }
    
    func getAnimes() -> AnyPublisher<[Animes], ServiceError> {
        Future { [weak self] promise in
            self?.networking.fetchData { result in
                switch result {
                case let .success(anime):
                    promise(.success(anime))
                case let .failure(error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}
