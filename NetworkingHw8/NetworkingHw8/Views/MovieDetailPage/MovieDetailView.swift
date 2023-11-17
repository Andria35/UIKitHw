//
//  MovieDetailView.swift
//  NetworkingHw8
//
//  Created by Andria Inasaridze on 17.11.23.
//

import UIKit

final class MovieDetailView: UIView {
    
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let detailsLabel: UILabel = {
        let label = UILabel()
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
        stackView.alignment = .leading
        stackView.spacing = 16
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
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    // MARK: - ViewLifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubViews()
    }
    
    private func setupSubViews() {
        addSubview(mainVStack)
        
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
        backgroundColor = .systemIndigo
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupMainVStackConstraints()
        setupMovieImageViewConstraints()
        setupDetailsVStackConstraints()
    }
    
    private func setupMainVStackConstraints(){
        mainVStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        mainVStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainVStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setupMovieImageViewConstraints() {
        movieImageView.topAnchor.constraint(equalTo: mainVStack.topAnchor).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: mainVStack.leadingAnchor).isActive = true
        movieImageView.trailingAnchor.constraint(equalTo: mainVStack.trailingAnchor).isActive = true
        movieImageView.heightAnchor.constraint(equalTo: mainVStack.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setupDetailsVStackConstraints() {
        detailsVStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        detailsVStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    }
    
    // MARK: - Class Methods
    func configureUI(
        voteAverage: Double,
        release: String,
        runtime: Int,
        genre: String,
        budget: Int,
        title: String,
        productionCountry: String,
        overview: String,
        image: UIImage
    ) {
        ratingValueLabel.text = String(format: "%.1f", voteAverage)
        releaseValueLabel.text = release
        runtimeValueLabel.text = "\(runtime) minutes"
        genreValueLabel.text = genre
        budgetValueLabel.text = "$\(budget)"
        titleValueLabel.text = title
        productionCountriesValueLabel.text = productionCountry
        detailsLabel.text =  "\(overview)"
        movieImageView.image = image
    }
}
