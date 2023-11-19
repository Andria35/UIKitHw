//
//  CatFacts.swift
//  ModularizationHw10
//
//  Created by Andria Inasaridze on 19.11.23.
//

import Foundation

// MARK: - CatFacts
struct CatFactsResponse: Decodable {
    let data: [CatFact]
}

// MARK: - Datum
struct CatFact: Decodable {
    let fact: String
}
