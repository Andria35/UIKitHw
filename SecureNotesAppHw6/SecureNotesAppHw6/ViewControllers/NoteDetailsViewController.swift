//
//  NoteDetailsViewController.swift
//  SecureNotesAppHw6
//
//  Created by Andria Inasaridze on 06.11.23.
//

import UIKit

final class NoteDetailsViewController: UIViewController {

    // MARK: - Class Properties
    weak var delegate: UpdateNoteDelegate?
    private let noteIndex: Int
    
    // MARK: - UI Components
    private let mainVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    private let noteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textColor = .black
        label.numberOfLines = 10
        return label
    }()
    
    private let selectedNoteTextView: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 16
        textView.layer.borderWidth = 1
        textView.layer.masksToBounds = true
        textView.layer.backgroundColor = UIColor.white.cgColor
        textView.layer.borderColor = UIColor.gray.cgColor
        return textView
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Update", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    init(noteIndex: Int) {
        self.noteIndex = noteIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubViews()
        setupSaveButton()
    }
    
    private func setupBackground() {
        view.backgroundColor = .white
    }
    
    private func setupSubViews() {
        view.addSubview(mainVStack)
        mainVStack.addArrangedSubview(noteLabel)
        mainVStack.addArrangedSubview(selectedNoteTextView)
        mainVStack.addArrangedSubview(updateButton)
    }
    
    private func setupSaveButton() {
        updateButton.addAction(UIAction(handler: { [weak self] action in
            guard let self = self else { return }
            guard let note = self.selectedNoteTextView.text else { return }
            if note == "" { return }
            self.delegate?.updateItem(text: note, index: self.noteIndex)
            self.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupMainVStackConstraints()
        setupSelectedNoteTextViewConstraints()
        setupUpdateButtonConstraints()
    }
    
    private func setupMainVStackConstraints() {
        mainVStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainVStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupSelectedNoteTextViewConstraints() {
        selectedNoteTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        selectedNoteTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        selectedNoteTextView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.3).isActive = true
    }
    
    private func setupUpdateButtonConstraints() {
        updateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        updateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        updateButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.09).isActive = true
    }
    
    // MARK: - Class Methods
    func configureNote(text: String) {
        noteLabel.text = "selected note: \(text)"
        selectedNoteTextView.text = text
    }
}

