//
//  ViewController.swift
//  NetworkingHw8
//
//  Created by Andria Inasaridze on 10.11.23.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Class Properties
    var homeView: HomeView
    var viewModel: HomeViewModel

    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = homeView
    }
    
    init() {
        self.homeView = HomeView()
        viewModel = HomeViewModel()
        super.init(nibName: nil, bundle: nil)
        homeView.delegate = self
        viewModel.updateData = self.homeView.reloadCollectionView
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: HomeView Delegate
extension HomeViewController: HomeViewDelegate {
    
    func registerCollectionViewCell(indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        let movie = viewModel.getMovieByIndex(index: indexPath.row)
        let movieGenre = viewModel.filterGenreByMovie(movie: movie)
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath)
        if let cell = cell as? MovieCollectionViewCell {
            cell.configure(name: movie.originalTitle, genre: movieGenre.first?.name ?? "", posterPath: movie.posterPath, rating: movie.voteAverage)
        }
        return cell
    }
    
    var movieCount: Int {
        return viewModel.getMovieCount()
    }
    
    func goToMovieDetailsViewController(index: Int) {
        let selectedMovie = viewModel.getMovieByIndex(index: index)
        let movieDetailVC = MovieDetailViewController(movieId: selectedMovie.id)
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
