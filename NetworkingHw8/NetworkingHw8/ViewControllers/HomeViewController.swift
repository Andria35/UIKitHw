//
//  ViewController.swift
//  NetworkingHw8
//
//  Created by Andria Inasaridze on 10.11.23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Class Properties
    private var movies: [Movie] = []
    private var genres: [Genre] = []
    
    // MARK: - UI Components
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        setupAPICalls()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubviews()
        setupCollectionView()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemIndigo
    }
    
    private func setupSubviews() {
        view.addSubview(collectionView)
    }
        
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.register(
            HeaderCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderCollectionReusableView.identifier
        )
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupCollectionViewConstraints()
    }
        
    private func setupCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5)
        ])
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
        DownloadManager.shared.downloadData(fromURL: url) { returnedData in
            if let data = returnedData {
                guard let newMovies = try? JSONDecoder().decode(MoviesURLResponse.self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.movies = newMovies.results
                    self?.collectionView.reloadData()
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
                    self?.collectionView.reloadData()
                }
            }
        }

    }
    
}

// MARK: - DataSource Extension
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        let movie = movies[indexPath.row]
        let movieGenre = genres.filter { $0.id == movie.genreIDS.first }
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath)
        if let cell = cell as? MovieCollectionViewCell {
            cell.configure(name: movie.originalTitle, genre: movieGenre.first?.name ?? "", posterPath: movie.posterPath, rating: movie.voteAverage)
        }
        return cell
    }
}

// MARK: - DelegateFlowLayout Extension
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width / 2) - 10
        return CGSize(width: size, height: 278)
    }
    
    // Vertical Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    // Horizontal Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HeaderCollectionReusableView.identifier,
            for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: view.frame.size.width, height: view.frame.size.height * 0.07)
    }
}

// MARK: - Delegate Extension
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        let movieDetailVC = MovieDetailViewController()
        movieDetailVC.configureMovie(movieId: selectedMovie.id)
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}
