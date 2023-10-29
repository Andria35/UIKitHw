//
//  ItemTableViewCell.swift
//  UITableViewHw4
//
//  Created by Andria Inasaridze on 29.10.23.
//

import UIKit

final class ItemTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let mainHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    
    private let itemImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    private let itemLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textColor = .darkText
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupView()
        setUpSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        itemLabel.text = nil
        itemImageView.image = nil
    }
    
    // MARK: - Configure
    func configure(with model: Song) {
        itemLabel.text = model.title
        itemImageView.image = model.image
    }
    
    private func setupView() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
    }
    
    private func setUpSubViews() {
        addSubview(mainHStack)
        mainHStack.addArrangedSubview(itemImageView)
        mainHStack.addArrangedSubview(itemLabel)
    }
    
    private func setupConstraints() {
        let screenWidth = UIScreen.main.bounds.size.width
        
        NSLayoutConstraint.activate([
            mainHStack.topAnchor.constraint(equalTo: self.topAnchor),
            mainHStack.leftAnchor.constraint(equalTo: self.leftAnchor),
            mainHStack.rightAnchor.constraint(equalTo: self.rightAnchor),
            mainHStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        itemImageView.heightAnchor.constraint(equalToConstant: screenWidth / 3).isActive = true
        itemImageView.widthAnchor.constraint(equalToConstant: screenWidth / 3).isActive = true
    }
}
