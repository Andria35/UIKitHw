//
//  Article.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import Foundation

// Type 'Article' does not conform to protocol 'Decodable'
// News ჭირდებოდა Decodable
struct Article: Decodable {
    // news array არის საჭირო
    let articles: [News]
}

