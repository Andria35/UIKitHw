//
//  ItemDetailsViewController.swift
//  UITableViewHw4
//
//  Created by Andria Inasaridze on 29.10.23.
//

import UIKit

final class ItemDetailsViewController: UIViewController {

    // MARK: - Properties
    private let mainVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        return stackView
    }()
    
    private let itemImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    private let itemTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 20)
//        label.font = UIFont(name: "Helvetica", size: 18)
        label.textColor = .darkText
        label.numberOfLines = 0
        return label
        
    }()
    
    private var item: Song?
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackground()
        setUpSubViews()
        setUpConstraints()
    }
    
    // MARK: - LifeCycles
    private func setUpBackground() {
        view.backgroundColor = .white
    }
    
    private func setUpSubViews() {
        view.addSubview(mainVStack)
        
        mainVStack.addArrangedSubview(itemImageView)
        mainVStack.addArrangedSubview(itemTitleLabel)
    }
    
    private func setUpConstraints() {
        setUpMainVStackConstraints()
        setUpItemImageViewConstraints()
    }
    
    private func setUpMainVStackConstraints() {
        NSLayoutConstraint.activate([
            mainVStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainVStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setUpItemImageViewConstraints() {
        let screenWidth = UIScreen.main.bounds.size.width
        itemImageView.heightAnchor.constraint(equalToConstant: screenWidth).isActive = true
        itemImageView.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
    }
        
    func configureItem(item: Song) {
        itemImageView.image = item.image
        itemTitleLabel.text = item.title
    }
}

