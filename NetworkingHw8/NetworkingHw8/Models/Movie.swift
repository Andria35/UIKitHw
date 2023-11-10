//
//  Movie.swift
//  NetworkingHw8
//
//  Created by Andria Inasaridze on 10.11.23.
//

import UIKit

// MARK: - Movie
struct MoviesURLResponse: Codable {
    let results: [Movie]
}

// MARK: - Result
struct Movie: Codable {
    let genreIDS: [Int]
    let id: Int
    let originalTitle: String
    let posterPath: String
    let voteAverage: Double
    
    
    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
