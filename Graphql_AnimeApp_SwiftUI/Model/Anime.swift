//
//  Anime.swift
//  Graphql_AnimeApp_SwiftUI
//
//  Created by Jooeun Kim on 2024-05-08.
//

import Foundation
import ChargeTripAPI
import Apollo

typealias AnimesData = AnimeQuery.Data.Page

struct Animes: Decodable {
    var animes: [Anime?] = []
    
    init(animes: AnimesData) {
        var value = animes.media?.map({ media -> Anime? in
            guard let media = media else { return nil }
           return Anime(
                id: media.id,
                idMal: media.idMal,
                type: media.type?.rawValue,
                format: media.format?.rawValue,
                status: media.status?.rawValue,
                description: media.description,
                episodes: media.episodes,
                duration: media.duration,
                bannerImage: media.bannerImage,
                genres: media.genres ?? [],
                averageScore: media.averageScore,
                isAdult: media.isAdult,
                siteUrl: media.siteUrl,
                startDate: .init(year:media.startDate?.year, 
                                 month:media.startDate?.month,
                                 day:media.startDate?.day),
                title: .init(romaji: media.title?.romaji, 
                             english:media.title?.english,
                             native: media.title?.native,
                             userPreferred: media.title?.userPreferred),
                coverImage: .init(extraLarge: media.coverImage?.extraLarge,
                                  large: media.coverImage?.large,
                                  medium: media.coverImage?.medium,
                                  color: media.coverImage?.color)
            )
        })
        
        self.animes = value ?? []
    }
}

struct Anime: Decodable, Identifiable, Hashable {
    
    var id: Int
    var idMal: Int?
    var type: String?
    var format: String?
    var status: String?
    var description: String?
    var episodes: Int?
    var duration: Int?
    var bannerImage: String?
    var genres: [String?]
    var averageScore: Int?
    var isAdult: Bool?
    var siteUrl: String?
    var startDate: StartDate?
    var title: Titles?
    var coverImage: CoverImage?
    
    init(id: Int, idMal: Int? = nil, type: String? = nil, format: String? = nil, status: String? = nil, description: String? = nil, episodes: Int? = nil, duration: Int? = nil, bannerImage: String? = nil, genres: [String?], averageScore: Int? = nil, isAdult: Bool? = nil, siteUrl: String? = nil, startDate: StartDate?, title: Titles?, coverImage: CoverImage?) {
        self.id = id
        self.idMal = idMal
        self.type = type
        self.format = format
        self.status = status
        self.description = description
        self.episodes = episodes
        self.duration = duration
        self.bannerImage = bannerImage
        self.genres = genres
        self.averageScore = averageScore
        self.isAdult = isAdult
        self.siteUrl = siteUrl
        self.startDate = startDate
        self.title = title
        self.coverImage = coverImage
    }
    
    struct StartDate: Decodable, Hashable {
        var year: Int?
        var month: Int?
        var day: Int?
        init(year: Int? = nil, month: Int? = nil, day: Int? = nil) {
            self.year = year
            self.month = month
            self.day = day
        }
    }

    struct Titles: Decodable, Hashable {
        var romaji: String?
        var english: String?
        var native: String?
        var userPreferred: String?
        init(romaji: String? = nil, english: String? = nil, native: String? = nil, userPreferred: String? = nil) {
            self.romaji = romaji
            self.english = english
            self.native = native
            self.userPreferred = userPreferred
        }
    }

    struct CoverImage: Decodable, Hashable {
        var extraLarge: String?
        var large: String?
        var medium: String?
        var color: String?
        init(extraLarge: String? = nil, large: String? = nil, medium: String? = nil, color: String? = nil) {
            self.extraLarge = extraLarge
            self.large = large
            self.medium = medium
            self.color = color
        }
    }

}

