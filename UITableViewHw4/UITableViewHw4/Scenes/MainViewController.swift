//
//  MainViewController.swift
//  UITableViewHw4
//
//  Created by Andria Inasaridze on 29.10.23.
//

import UIKit

protocol AddItemDelegate: AnyObject {
    func addItem(itemTitle: String, itemImageView: UIImage)
}

final class MainViewController: UIViewController {

    // MARK: - Properties
    private var addButton: UIBarButtonItem!
    private var editButton: UIBarButtonItem!
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var songs: [Song] = Song.dummySongs
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackground()
        setUpNavigationBar()
        setUpSubViews()
        setUpConstraints()
        setUpTableView()
    }
    
    // MARK: - SetUp UI
    private func setUpBackground() {
        view.backgroundColor = .white
    }
    
    private func setUpSubViews() {
        view.addSubview(tableView)
    }
    
    private func setUpConstraints() {
        setUpTableViewConstraints()
    }
    
    private func setUpNavigationBar() {
        // setUp Navigation Bar items
        setUpNavigationBarButtons()
        let barTitle = "Favourite Songs"
        
        // Add Items to Navigation bar
        navigationItem.rightBarButtonItem = addButton
        navigationItem.title = barTitle
        navigationItem.leftBarButtonItem = editButton
    }
    
    private func setUpNavigationBarButtons() {
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))

    }
    
    @objc private func addButtonTapped() {
        let addNewItemViewController = AddNewItemToListViewController()
        addNewItemViewController.delegate = self
        navigationController?.pushViewController(addNewItemViewController, animated: true)

    }
    
    @objc private func editButtonTapped() {
            // Toggle editing mode for the table view
            tableView.isEditing = !tableView.isEditing
        }
    
    private func setUpTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        // register cell
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "songCell")
    }
}

// MARK: - TableView DataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let song = songs[indexPath.row]
        cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        if let cell = cell as? ItemTableViewCell {
            cell.configure(with: song)
        }
        return cell
    }
}

// MARK: - TableView Delegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemViewController = ItemDetailsViewController()
        itemViewController.configureItem(item: songs[indexPath.row])
        navigationController?.pushViewController(itemViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                songs.remove(at: indexPath.row)
                // Update the table view
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedItem = songs[sourceIndexPath.row]
        songs.remove(at: sourceIndexPath.row)
        songs.insert(movedItem, at: destinationIndexPath.row)
    }
}

extension MainViewController: AddItemDelegate {
    func addItem(itemTitle: String, itemImageView: UIImage) {
        let newSong = Song(title: itemTitle, image: itemImageView)
        songs.append(newSong)
        tableView.reloadData()
    }
}
