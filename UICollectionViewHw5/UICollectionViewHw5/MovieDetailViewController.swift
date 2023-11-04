//
//  MovieDetailViewController.swift
//  UICollectionViewHw5
//
//  Created by Andria Inasaridze on 04.11.23.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    // MARK: - Class Properties
    
    private var movie: Movie
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
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private let imdbLabel: UILabel = {
        let label = UILabel()
        label.text = "IMDB"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    private let detailsVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.backgroundColor = UIColor(red: 0.102, green: 0.133, blue: 0.196, alpha: 1)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    }()
    
    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // Set the number of lines to 0 for unlimited lines.
        label.lineBreakMode = .byWordWrapping // Use word wrapping for line breaks.
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
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
    
    private let certificateLabel: UILabel = {
        let label = UILabel()
        label.text = "Certificate"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .gray
        return label
    }()
    
    private let certificateValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Certificate"
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
        label.text = "Runtime"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .gray
        return label
    }()
    
    private let runtimeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Certificate"
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
        label.text = "Release"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .gray
        return label
    }()
    
    private let releaseValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Certificate"
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
        label.text = "Genre"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .gray
        return label
    }()
    
    private let genreValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Certificate"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    private let directorHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.text = "Director"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .gray
        return label
    }()
    
    private let directorValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Certificate"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    private let castHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let castLabel: UILabel = {
        let label = UILabel()
        label.text = "Director"
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .gray
        return label
    }()
    
    private let castValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // Set the number of lines to 0 for unlimited lines.
        label.lineBreakMode = .byWordWrapping // Use word wrapping for line breaks.
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    private let selectSessionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select Session", for: .normal)
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMovie()
        setupUI()
        setupConstraints()
    }
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        ratingVStack.addArrangedSubview(ratingLabel)
        ratingVStack.addArrangedSubview(imdbLabel)
        mainVStack.addArrangedSubview(ratingVStack)
        detailsVStack.addArrangedSubview(detailsLabel)
        mainVStack.addArrangedSubview(detailsVStack)
        
        certificateHStack.addArrangedSubview(certificateLabel)
        certificateHStack.addArrangedSubview(certificateValueLabel)
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
        
        directorHStack.addArrangedSubview(directorLabel)
        directorHStack.addArrangedSubview(directorValueLabel)
        detailsVStack.addArrangedSubview(directorHStack)
        
        castHStack.addArrangedSubview(castLabel)
        castHStack.addArrangedSubview(castValueLabel)
        detailsVStack.addArrangedSubview(castHStack)
        
        detailsVStack.addArrangedSubview(selectSessionButton)


    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor.backgroundColor

    }
    
    private func setupNavigationBar() {
        let barTitle = movie.name
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationItem.title = barTitle
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupMainVStackConstraints()
        setupMovieImageViewConstraints()
        setupDetailsVStackConstraints()
        setupSelectSessionButton()
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
    
    private func setupSelectSessionButton() {
        selectSessionButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.914).isActive = true
        selectSessionButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.065).isActive = true
    }
    
    // MARK: - Class Methods
    
    private func configureMovie() {
        movieImageView.image = movie.image
        ratingLabel.text = movie.imdb
        detailsLabel.text = movie.description
        certificateValueLabel.text = movie.certificate
        runtimeValueLabel.text = movie.runTime
        releaseValueLabel.text = movie.release
        genreValueLabel.text = movie.genre
        directorValueLabel.text = movie.director
        castValueLabel.text = movie.cast
    }
    
}
