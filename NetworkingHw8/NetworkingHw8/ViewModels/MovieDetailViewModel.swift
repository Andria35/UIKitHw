//
//  MovieDetailViewModel.swift
//  NetworkingHw8
//
//  Created by Andria Inasaridze on 17.11.23.
//

import UIKit

final class MovieDetailViewModel {
    
    // MARK: - Class Properties
    var movie: MovieDetails?
    var movieImage: UIImage?
    var onDataUpdate: (() async -> Void)?
    init(movieId: Int) {
        Task {
            await configureMovie(movieId: movieId)
            await configureMovieImage(backdropPath: movie?.backdropPath ?? "")
            await onDataUpdate?()
        }
    }
    
    // MARK: - Class Methods
    func configureMovie(movieId: Int) async {
        let urlString = "https://api.themoviedb.org/3/movie/\(movieId)?api_key="
        let apiKey = "eb48012526011eb1da6f6963274b867d"
        do {
            let data = try await DownloadManager.shared.fetchData(fromURL: "\(urlString)\(apiKey)")
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            movie = try decoder.decode(MovieDetails.self, from: data)
        } catch {
            print(error)
        }
    }
    
    private func configureMovieImage(backdropPath: String) async {
        let urlString = "https://image.tmdb.org/t/p/original/\(backdropPath)"
        do {
            let data = try await DownloadManager.shared.fetchData(fromURL: urlString)
            movieImage = UIImage(data: data)
        } catch {
            print(error)
        }
    }
}
