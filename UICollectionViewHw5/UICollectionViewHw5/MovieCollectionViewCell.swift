//
//  MovieCollectionViewCell.swift
//  UICollectionViewHw5
//
//  Created by Andria Inasaridze on 03.11.23.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {
    // MARK: - Class Properties
    static let identifier = "MovieCollectionViewCell"
    
    // MARK: - UI Components
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .gray
        button.isEnabled = true
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "5.5"
        label.textColor = .white
        return label
    }()
    
    private let ratingView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .orange
        containerView.layer.cornerRadius = 5.0
        containerView.layer.masksToBounds = true
        return containerView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        genreLabel.text = nil
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubViews()
        setupFavoriteButton()
    }
    
    private func setupBackground() {
        backgroundColor = .none
    }
    
    private func setupSubViews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(genreLabel)
        addSubview(favoriteButton)
        
        ratingView.addSubview(ratingLabel)
        imageView.addSubview(ratingView)
    }
    
    private func setupFavoriteButton() {
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func favoriteButtonTapped() {
        if favoriteButton.tintColor == .gray {
            favoriteButton.tintColor = .red
        } else {
            favoriteButton.tintColor = .gray
        }
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupImageConstraints()
        setupNameLabelConstraints()
        setupGenreLabelConstraints()
        
        setupRatingViewConstraints()
        setupRatingLabelConstraints()
        setupFavoriteButtonConstraints()
    }
        
    private func setupImageConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo:bottomAnchor, constant: -self.frame.height * 0.2)
        ])
    }
    
    private func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    private func setupGenreLabelConstraints() {
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    private func setupRatingViewConstraints() {
        ratingView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 4).isActive = true
        ratingView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8).isActive = true
        ratingView.heightAnchor.constraint(equalToConstant: 23).isActive = true
        ratingView.widthAnchor.constraint(equalToConstant: 33).isActive = true
    }
    
    private func setupRatingLabelConstraints() {
        ratingLabel.centerXAnchor.constraint(equalTo: ratingView.centerXAnchor).isActive = true
        ratingLabel.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor).isActive = true
    }
    
    private func setupFavoriteButtonConstraints() {
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            favoriteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }
    
    // MARK: - Class Methods
    func configure(with movie: Movie){
        imageView.image = movie.poster
        nameLabel.text = movie.name
        genreLabel.text = movie.genre
        ratingLabel.text = movie.imdb
    }
}
