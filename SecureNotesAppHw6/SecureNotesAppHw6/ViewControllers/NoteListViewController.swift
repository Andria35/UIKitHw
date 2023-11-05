//
//  NoteListViewController.swift
//  SecureNotesAppHw6
//
//  Created by Andria Inasaridze on 05.11.23.
//

import UIKit

protocol UpdateNoteDelegate: AnyObject {
    func addItem(note: String)
    func updateItem(text: String, index: Int)
}

final class NoteListViewController: UIViewController {
    
    // MARK: - Class Properties
    private let username: String
    private let password: String
    private let userDefaultKey: String
    private let tableViewCellId = "noteCell"
    private var notes: [String] = [] {
        didSet {
            UserDefaults.standard.set(notes, forKey: userDefaultKey)
        }
    }
    
    // MARK: - UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var addButton: UIBarButtonItem = {
       UIBarButtonItem()
    }()
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        setupUserDefaults()
    }
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
        userDefaultKey = "\(username)\(password)Notes"
        super.init(nibName: nil, bundle: nil)
        
        print(userDefaultKey)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI () {
        setupBackground()
        setupSubviews()
        setupTableView()
        setupNavigationBar()
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupBackground() {
        view.backgroundColor = .white
    }
    
    private func setupNavigationBar() {
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        let barTitle = "\(username)'s Notes"
        navigationItem.rightBarButtonItem = addButton
        navigationItem.title = barTitle
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        // register cell
        tableView.register(NoteTableViewCell.self, forCellReuseIdentifier: tableViewCellId)
    }
    
    // MARK: - Actions
    @objc func addButtonTapped() {
        let addNoteVC = AddNoteViewController()
        addNoteVC.delegate = self
        
        present(addNoteVC, animated: true)
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
    
    // MARK: - Class Methods
    private func setupUserDefaults() {
        notes = UserDefaults.standard.stringArray(forKey: userDefaultKey) ?? []
    }
}

// MARK: - TableView DataSource
extension NoteListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let note = notes[indexPath.row]
        cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath)
        if let cell = cell as? NoteTableViewCell {
            cell.configure(with: note)
        }
        return cell
    }
}

// MARK: - TableView Delegate
extension NoteListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteDetailsVC = NoteDetailsViewController(noteIndex: indexPath.row)
        noteDetailsVC.configureNote(text: notes[indexPath.row])
        noteDetailsVC.delegate = self
        navigationController?.pushViewController(noteDetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                notes.remove(at: indexPath.row)
                // Update the table view
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
}

// MARK: - UpdateNoteDelegate
extension NoteListViewController: UpdateNoteDelegate {
    func addItem(note: String) {
        notes.append(note)
        tableView.reloadData()
    }
    
    func updateItem(text: String, index: Int) {
        notes[index] = text
        tableView.reloadData()
    }
}


