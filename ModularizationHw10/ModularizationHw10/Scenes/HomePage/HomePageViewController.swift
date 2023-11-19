//
//  HomePageViewController.swift
//  ModularizationHw10
//
//  Created by Andria Inasaridze on 19.11.23.
//

import UIKit

final class HomePageViewController: UIViewController {
    
    // MARK: - Class Properties
    private let viewModel = HomePageViewModel()
    private var catFacts = [CatFact]()
    
    // MARK: - UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        viewModel.viewDidLoad()
        viewModel.delegate = self
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubviews()
        setupTableView()
    }
    
    private func setupBackground() {
        view.backgroundColor = .white
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(HomePageTableViewCell.self, forCellReuseIdentifier: HomePageTableViewCell.cellId)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupTableViewConstraints()
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
}

// MARK: - TableView DataSource
extension HomePageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catFacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let catFact = catFacts[indexPath.row].fact
        cell = tableView.dequeueReusableCell(withIdentifier: HomePageTableViewCell.cellId, for: indexPath)
        if let cell = cell as? HomePageTableViewCell {
            cell.configure(with: catFact)
        }
        return cell
    }
}

// MARK: - HomePageViewModelDelegate
extension HomePageViewController: HomePageViewModelDelegate {
    func catFactsFetched(_ catFacts: [CatFact]) {
        self.catFacts = catFacts
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        print("xxxx Error: \(error)")
    }
}
