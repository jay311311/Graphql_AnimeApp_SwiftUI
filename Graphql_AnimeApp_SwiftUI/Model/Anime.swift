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
           return Anime(id: media.id,
                  idMal: media.idMal,
                  type: media.type?.rawValue,
                  format: media.format?.rawValue,
                  status: media.status?.rawValue,
                  description: media.description,
                  season: media.season?.rawValue,
                  seasonYear: media.seasonYear,
                  seasonInt: media.seasonInt,
                  episodes: media.episodes,
                  duration: media.duration,
                  countryOfOrigin: media.countryOfOrigin,
                  isLicensed: media.isLicensed,
                  source: media.source?.rawValue,
                  updatedAt: media.updatedAt,
                  bannerImage: media.bannerImage,
                  genres: media.genres ?? [],
                  synonyms: media.synonyms ?? [],
                  averageScore: media.averageScore,
                  meanScore: media.meanScore,
                  popularity: media.popularity,
                  trending: media.trending,
                  favourites: media.favourites,
                  isAdult: media.isAdult,
                  siteUrl: media.siteUrl)
        })
        
        self.animes = value ?? []
    
    }
}

struct Anime: Decodable, Identifiable,Hashable {
    var id: Int
    var idMal: Int?
    var type: String?
    var format: String?
    var status: String?
    var description: String?
    var season: String?
    var seasonYear: Int?
    var seasonInt: Int?
    var episodes: Int?
    var duration: Int?
    var countryOfOrigin: String?
    var isLicensed: Bool?
    var source: String?
    var updatedAt: Int?
    var bannerImage: String?
    var genres: [String?]
    var synonyms: [String?]
    var averageScore: Int?
    var meanScore: Int?
    var popularity: Int?
    var trending: Int?
    var favourites: Int?
    var isAdult: Bool?
    var siteUrl: String?
    
    init(id: Int, idMal: Int? = nil, type: String? = nil, format: String? = nil, status: String? = nil, description: String? = nil, season: String? = nil, seasonYear: Int? = nil, seasonInt: Int? = nil, episodes: Int? = nil, duration: Int? = nil, countryOfOrigin: String? = nil, isLicensed: Bool? = nil, source: String? = nil, updatedAt: Int? = nil, bannerImage: String? = nil, genres: [String?], synonyms: [String?], averageScore: Int? = nil, meanScore: Int? = nil, popularity: Int? = nil, trending: Int? = nil, favourites: Int? = nil, isAdult: Bool? = nil, siteUrl: String? = nil) {
        self.id = id
        self.idMal = idMal
        self.type = type
        self.format = format
        self.status = status
        self.description = description
        self.season = season
        self.seasonYear = seasonYear
        self.seasonInt = seasonInt
        self.episodes = episodes
        self.duration = duration
        self.countryOfOrigin = countryOfOrigin
        self.isLicensed = isLicensed
        self.source = source
        self.updatedAt = updatedAt
        self.bannerImage = bannerImage
        self.genres = genres
        self.synonyms = synonyms
        self.averageScore = averageScore
        self.meanScore = meanScore
        self.popularity = popularity
        self.trending = trending
        self.favourites = favourites
        self.isAdult = isAdult
        self.siteUrl = siteUrl
    }
}
