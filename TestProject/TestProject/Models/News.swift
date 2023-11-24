//
//  News.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import Foundation

struct News: Decodable {
    // აქ authors - ის დაწერა author ის ნაცვლად pure evil იყო... :(
    let author: String?
    let title: String?
    let urlToImage: String?
}
