//
//  MovieDetailViewController.swift
//  NetworkingHw8
//
//  Created by Andria Inasaridze on 11.11.23.
//

import UIKit




final class MovieDetailViewController: UIViewController {
    
    // MARK: - Class Properties
    var movieDetailView: MovieDetailView
    var viewModel: MovieDetailViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = movieDetailView
    }
    
    init(movieId: Int) {
        self.movieDetailView = MovieDetailView()
        viewModel = MovieDetailViewModel(movieId: movieId)
        super.init(nibName: nil, bundle: nil)
        viewModel.onDataUpdate = configureUIData
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
            
    // MARK: - Class Methods
    private func configureUIData() async {
        guard
            let movie = viewModel.movie,
            let image = viewModel.movieImage else { return }
        
        movieDetailView.configureUI(voteAverage: movie.voteAverage, release: movie.releaseDate, runtime: movie.runtime, genre: movie.genres.first?.name ?? "", budget: movie.budget, title: movie.originalTitle, productionCountry: movie.productionCountries.first?.name ?? "", overview: movie.overview, image: image)
    }    
}
