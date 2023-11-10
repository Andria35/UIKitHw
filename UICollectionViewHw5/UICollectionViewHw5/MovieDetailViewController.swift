//
//  MovieDetailViewController.swift
//  UICollectionViewHw5
//
//  Created by Andria Inasaridze on 04.11.23.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    
    // MARK: - Class Properties
    private var movie: MovieDetails?
    
    // MARK: - UI Components
    private let mainVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        return stackView
    }()
    
    private let movieImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let ratingVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        return stackView
    }()
    
    private let ratingValueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Rating"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    private let detailsVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
//        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
        label.text = " "
        return label
    }()
    
    private let certificateHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title:"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let titleValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    private let runtimeHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let runtimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Runtime:"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let runtimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    private let releaseHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let releaseLabel: UILabel = {
        let label = UILabel()
        label.text = "Release:"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let releaseValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    private let genreHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Genre:"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let genreValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    private let budgetHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let budgetLabel: UILabel = {
        let label = UILabel()
        label.text = "Budget:"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let budgetValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    private let productionCountriesHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let productionCountriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Production Country:"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let productionCountriesValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubViews()
        setupNavigationBar()
    }
    
    private func setupSubViews() {
        view.addSubview(mainVStack)
        
        mainVStack.addArrangedSubview(movieImageView)
        ratingVStack.addArrangedSubview(ratingValueLabel)
        ratingVStack.addArrangedSubview(ratingLabel)
        mainVStack.addArrangedSubview(ratingVStack)
        detailsVStack.addArrangedSubview(detailsLabel)
        mainVStack.addArrangedSubview(detailsVStack)
        
        certificateHStack.addArrangedSubview(titleLabel)
        certificateHStack.addArrangedSubview(titleValueLabel)
        detailsVStack.addArrangedSubview(certificateHStack)
        
        runtimeHStack.addArrangedSubview(runtimeLabel)
        runtimeHStack.addArrangedSubview(runtimeValueLabel)
        detailsVStack.addArrangedSubview(runtimeHStack)
        
        releaseHStack.addArrangedSubview(releaseLabel)
        releaseHStack.addArrangedSubview(releaseValueLabel)
        detailsVStack.addArrangedSubview(releaseHStack)
        
        genreHStack.addArrangedSubview(genreLabel)
        genreHStack.addArrangedSubview(genreValueLabel)
        detailsVStack.addArrangedSubview(genreHStack)
        
        budgetHStack.addArrangedSubview(budgetLabel)
        budgetHStack.addArrangedSubview(budgetValueLabel)
        detailsVStack.addArrangedSubview(budgetHStack)
        
        productionCountriesHStack.addArrangedSubview(productionCountriesLabel)
        productionCountriesHStack.addArrangedSubview(productionCountriesValueLabel)
        detailsVStack.addArrangedSubview(productionCountriesHStack)
        
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemIndigo
    }
    
    private func setupNavigationBar() {
//        let barTitle = movie.name
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
//        navigationItem.title = barTitle
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupMainVStackConstraints()
        setupMovieImageViewConstraints()
        setupDetailsVStackConstraints()
    }
    
    private func setupMainVStackConstraints(){
        mainVStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        mainVStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainVStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setupMovieImageViewConstraints() {
        movieImageView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.247).isActive = true
    }
    
    private func setupDetailsVStackConstraints() {
        detailsVStack.widthAnchor.constraint(equalToConstant: view.frame.width * 0.914).isActive = true
    }
        
    // MARK: - Class Methods
    func configureMovie(movieId: Int) {
        let urlString = "https://api.themoviedb.org/3/movie/\(movieId)?api_key="
        let apiKey = "eb48012526011eb1da6f6963274b867d"
        Task {
            do {
                let data = try await DownloadManager.shared.fetchData(fromURL: "\(urlString)\(apiKey)")
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                movie = try decoder.decode(MovieDetails.self, from: data)
            } catch {
                print(error)
            }
            await configureUIData()
        }
    }
    
    func configureUIData() async {
        guard let movie = self.movie else { return }
        await downloadMovieImage(backdropPath: movie.backdropPath)
        ratingValueLabel.text = String(format: "%.1f", movie.voteAverage)
        releaseValueLabel.text = movie.releaseDate
        runtimeValueLabel.text = "\(movie.runtime) minutes"
        genreValueLabel.text = movie.genres.first?.name ?? ""
        budgetValueLabel.text = "$\(movie.budget)"
        titleValueLabel.text = movie.originalTitle
        productionCountriesValueLabel.text = movie.productionCountries.first?.name ?? ""
        detailsLabel.text =  "\(movie.overview)"
    }
    
    private func downloadMovieImage(backdropPath: String) async {
        let urlString = "https://image.tmdb.org/t/p/original/\(backdropPath)"
        do {
            let data = try await DownloadManager.shared.fetchData(fromURL: urlString)
            let image = UIImage(data: data)
            movieImageView.image = image
        } catch {
            print(error)
        }
    }
}
