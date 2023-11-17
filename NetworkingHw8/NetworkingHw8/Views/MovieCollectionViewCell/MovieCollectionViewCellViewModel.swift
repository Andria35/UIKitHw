//
//  MovieCollectionViewCellViewModel.swift
//  NetworkingHw8
//
//  Created by Andria Inasaridze on 18.11.23.
//

import UIKit

final class MovieCollectionViewCellViewModel {
    
    var updateData: ((_ poserPath: UIImage) -> Void)?

    func downloadMoviePoster(poserPath: String) {
        let urlString = "https://image.tmdb.org/t/p/original/\(poserPath)"
        guard let url = URL(string: urlString) else { return }
        DownloadManager.shared.downloadData(fromURL: url) { returnedData in
            if let data = returnedData {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.updateData?(image)
                    }
                }
            }
        }
    }
}
