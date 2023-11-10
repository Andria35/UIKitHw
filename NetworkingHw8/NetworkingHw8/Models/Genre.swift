//
//  Genre.swift
//  NetworkingHw8
//
//  Created by Andria Inasaridze on 10.11.23.
//

import Foundation

struct GenreURLResponse: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
