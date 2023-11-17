//
//  Genre.swift
//  NetworkingHw8
//
//  Created by Andria Inasaridze on 10.11.23.
//

import Foundation

struct GenreURLResponse: Decodable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Decodable {
    let id: Int
    let name: String
}
