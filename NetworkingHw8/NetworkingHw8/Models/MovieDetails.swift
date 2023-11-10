//
//  MovieDetails.swift
//  NetworkingHw8
//
//  Created by Andria Inasaridze on 10.11.23.
//

import Foundation

// MARK: - Welcome
struct MovieDetails: Codable {
    
    let backdropPath: String
    let budget: Int
    let genres: [Genre]
    let id: Int
    let originalTitle, overview: String
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let runtime: Int
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case backdropPath
        case budget, genres, id
        case originalTitle
        case overview
        case productionCountries
        case releaseDate
        case runtime
        case voteAverage
    }
    
    struct Genre: Codable {
        let id: Int
        let name: String
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

