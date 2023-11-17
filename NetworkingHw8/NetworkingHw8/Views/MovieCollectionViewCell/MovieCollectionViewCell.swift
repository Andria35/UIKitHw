//
//  MovieCollectionViewCell.swift
//  NetworkingHw8
//
//  Created by Andria Inasaridze on 11.11.23.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {
    // MARK: - Class Properties
    static let identifier = "MovieCollectionViewCell"
    var viewModel: MovieCollectionViewCellViewModel
    
    // MARK: - UI Components
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
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
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "test"
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PTRootUI-Regular", size: 14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "test"
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        
        self.viewModel = MovieCollectionViewCellViewModel()
        super.init(frame: frame)
        self.viewModel.updateData = self.updatePoster

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
    }
    
    private func setupBackground() {
        backgroundColor = .none
    }
    
    private func setupSubViews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(genreLabel)
        
        ratingView.addSubview(ratingLabel)
        imageView.addSubview(ratingView)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupImageConstraints()
        setupNameLabelConstraints()
        setupGenreLabelConstraints()
        
        setupRatingViewConstraints()
        setupRatingLabelConstraints()
    }
        
    private func setupImageConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo:bottomAnchor, constant: -self.frame.height * 0.2)
        ])
    }
    
    private func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
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
        
    // MARK: - Class Methods
    func configure(name: String, genre: String, posterPath: String, rating: Double){
        nameLabel.text = name
        genreLabel.text = genre
        ratingLabel.text = String(format: "%.1f", rating)
        viewModel.downloadMoviePoster(poserPath: posterPath)
    }
    
    func updatePoster(image: UIImage) {
        imageView.image = image
    }
        
    private func downloadMoviePoster(poserPath: String) {
        let urlString = "https://image.tmdb.org/t/p/original/\(poserPath)"
        
        guard let url = URL(string: urlString) else { return }
        DownloadManager.shared.downloadData(fromURL: url) { returnedData in
            if let data = returnedData {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.imageView.image = image
                    }
                }
            }
        }
    }
}
