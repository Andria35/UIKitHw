//
//  AddNoteViewController.swift
//  SecureNotesAppHw6
//
//  Created by Andria Inasaridze on 05.11.23.
//

import UIKit

final class AddNoteViewController: UIViewController {

    // MARK: - Class Properties
    weak var delegate: UpdateNoteDelegate?
    
    // MARK: - UI Components
    private let mainVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    private let newNoteTextView: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 16
        textView.layer.borderWidth = 1
        textView.layer.masksToBounds = true
        textView.layer.backgroundColor = UIColor.white.cgColor
        textView.layer.borderColor = UIColor.gray.cgColor
        return textView
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
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
        mainVStack.addArrangedSubview(newNoteTextView)
        mainVStack.addArrangedSubview(saveButton)
    }
    
    private func setupSaveButton() {
        saveButton.addAction(UIAction(handler: { [weak self] action in
            guard let note = self?.newNoteTextView.text else { return }
            self?.delegate?.addItem(note: note)
            self?.dismiss(animated: true)
        }), for: .touchUpInside)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupMainVStackConstraints()
        setupNewNoteTextViewConstraints()
        setupSaveButtonConstraints()
    }
    
    private func setupMainVStackConstraints() {
        mainVStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainVStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupNewNoteTextViewConstraints() {
        newNoteTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        newNoteTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        newNoteTextView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.5).isActive = true
    }
    
    private func setupSaveButtonConstraints() {
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.09).isActive = true
    }
}
