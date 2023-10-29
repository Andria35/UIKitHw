//
//  Song.swift
//  UITableViewHw4
//
//  Created by Andria Inasaridze on 29.10.23.
//

import UIKit

struct Song {
    let title: String
    let image: UIImage?
    
    static let dummySongs = [
        Song(title: "Hey You", image: UIImage(named: "David Gilmour")),
        Song(title: "High Hopes", image: UIImage(named: "Division Bell")),
        Song(title: "Gethsemane", image: UIImage(named: "Superstar")),
        Song(title: "Sweet Child In Time", image: UIImage(named: "Deep Purple")),
        Song(title: "Echoes", image: UIImage(named: "Echoes"))
    ]
}
