//
//  MovieDetailViewController.swift
//  UICollectionViewHw5
//
//  Created by Andria Inasaridze on 04.11.23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    // MARK: - Class Properties
    private var movie: Movie
    // MARK: - UI Components
    private let mainVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.backgroundColor = .red
        return stackView
    }()
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        setupNavigationBar()
        
    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor.backgroundColor

    }
    
    private func setupNavigationBar() {
        let barTitle = movie.name
        
        // Set the font and color for the navigation bar title
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),  // Change the font and size
            NSAttributedString.Key.foregroundColor: UIColor.white  // Change the title color to white
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationItem.title = barTitle
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
//        setupMainVStackConstraints()
    }
    
    private func setupMainVStackConstraints(){
        mainVStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainVStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true // Use safeAreaLayoutGuide for both top and bottom
        mainVStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        mainVStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
    }
    
    // MARK: - Class Methods
    

}
