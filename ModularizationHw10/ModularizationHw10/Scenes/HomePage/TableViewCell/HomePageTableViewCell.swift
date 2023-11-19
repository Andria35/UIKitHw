//
//  HomePageTableViewCell.swift
//  ModularizationHw10
//
//  Created by Andria Inasaridze on 19.11.23.
//

import UIKit

final class HomePageTableViewCell: UITableViewCell {
    
    // MARK: - Class Properties
    static let cellId = "HomePageCell"
    
    // MARK: - UI Components
    private let mainHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    private let noteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let noteImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.image = UIImage(systemName: "cat.fill")
        return image
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        noteLabel.text = nil
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(mainHStack)
        mainHStack.addArrangedSubview(noteImageView)
        mainHStack.addArrangedSubview(noteLabel)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupMainHStackConstraints()
        setupNoteImageViewConstraints()
    }
    
    private func setupMainHStackConstraints() {
        NSLayoutConstraint.activate([
            mainHStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            mainHStack.leftAnchor.constraint(equalTo: self.leftAnchor),
            mainHStack.rightAnchor.constraint(equalTo: self.rightAnchor),
            mainHStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
        ])
    }
    
    private func setupNoteImageViewConstraints() {
        noteImageView.heightAnchor.constraint(equalToConstant: self.frame.width * 0.1).isActive = true
        noteImageView.widthAnchor.constraint(equalToConstant: self.frame.width * 0.1).isActive = true
    }
    
    // MARK: - Class Methods
    func configure(with catFact: String) {
        noteLabel.text = catFact
    }
}
