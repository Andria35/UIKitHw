//
//  HomeViewModel.swift
//  NetworkingHw8
//
//  Created by Andria Inasaridze on 17.11.23.
//

import UIKit

class HomeViewModel {
    
    // MARK: - Class Properties
    private var movies: [Movie] = []
    private var genres: [Genre] = []
    var updateData: (() -> Void)?
    
    func getMovieCount() -> Int {
        movies.count
    }
    
    func getMovieByIndex(index: Int) -> Movie {
        movies[index]
    }
    
    func filterGenreByMovie(movie: Movie) -> [Genre] {
        genres.filter { $0.id == movie.genreIDS.first }
    }
    
    // MARK: Init
    init() {
        setupAPICalls()
    }
    
    // MARK: - API Calls
    private func setupAPICalls() {
        downloadMovies()
        downloadGenres()
    }
    
    private func downloadMovies() {
        let urlString = "https://api.themoviedb.org/3/movie/top_rated?api_key="
        let apiKey = "eb48012526011eb1da6f6963274b867d"
        
        guard let url = URL(string: "\(urlString)\(apiKey)") else { return }
        DownloadManager.shared.downloadData(fromURL: url) { [weak self] returnedData in
            if let data = returnedData {
                guard let newMovies = try? JSONDecoder().decode(MoviesURLResponse.self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.movies = newMovies.results
                    self?.updateData?()
                }
            }
        }
    }
    
    private func downloadGenres() {
        let urlString = "https://api.themoviedb.org/3/genre/movie/list?api_key="
        let apiKey = "eb48012526011eb1da6f6963274b867d"
        
        guard let url = URL(string: "\(urlString)\(apiKey)") else { return }
        DownloadManager.shared.downloadData(fromURL: url) { returnedData in
            if let data = returnedData {
                guard let newGenres = try? JSONDecoder().decode(GenreURLResponse.self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.genres = newGenres.genres
                    self?.updateData?()
                }
            }
        }
    }
}
