//
//  AddNewItemToListViewController.swift
//  UITableViewHw4
//
//  Created by Andria Inasaridze on 29.10.23.
//

import UIKit

final class AddNewItemToListViewController: UIViewController {

    // MARK: - Properties
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    weak var delegate: AddItemDelegate?
    
    private let mainVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    private let newItemTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Add New Song"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 16 // Set the corner radius for a capsule shape
        textField.layer.borderWidth = 1 // Add a border
        textField.layer.masksToBounds = true
        textField.layer.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1).cgColor
        textField.layer.borderColor = UIColor(red: 0.698, green: 0.698, blue: 0.698, alpha: 0.25).cgColor
        
        // Add left padding to the text field
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    private let addImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Image", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        return button
    }()
    
    private let itemImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.image = UIImage(systemName: "photo.badge.plus")
        return image
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        return button
    }()
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackground()
        setUpSubviews()
        setUpConstraints()
        setUpButtonActions()
    }
    
    // MARK: - SetUp UI
    private func setUpBackground() {
        view.backgroundColor = .white
    }
    
    private func setUpSubviews() {
        view.addSubview(mainVStack)
        
        mainVStack.addArrangedSubview(newItemTextField)
        mainVStack.addArrangedSubview(addImageButton)
        mainVStack.addArrangedSubview(itemImageView)
        mainVStack.addArrangedSubview(saveButton)
    }
    
    private func setUpButtonActions() {
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        addImageButton.addTarget(self, action: #selector(addImageButtonTapped), for: .touchUpInside)
    }
    
    @objc private func saveButtonTapped() {
        guard let title = newItemTextField.text,
              let image = itemImageView.image else { return }
        if title.isEmpty || image == UIImage(systemName: "photo.badge.plus") {
            return
        }
        delegate?.addItem(itemTitle: title, itemImageView: image)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func addImageButtonTapped() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    private func setUpConstraints() {
        setUpMainVStackConstraints()
        setUpNewItemTextFieldConstraints()
        setUpAddImageButtonConstraints()
        setUpItemImageViewConstraints()
        setUpSaveButtonConstraints()
    }
    
    private func setUpMainVStackConstraints() {
        NSLayoutConstraint.activate([
            mainVStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainVStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setUpNewItemTextFieldConstraints() {
        newItemTextField.heightAnchor.constraint(equalToConstant: screenHeight * 0.07).isActive = true // Increase the height
        newItemTextField.widthAnchor.constraint(equalToConstant: screenWidth * 0.9).isActive = true // Increase the height
    }
    
    private func setUpAddImageButtonConstraints() {
        addImageButton.heightAnchor.constraint(equalToConstant: screenHeight * 0.06).isActive = true
        addImageButton.widthAnchor.constraint(equalToConstant: screenWidth * 0.8).isActive = true
    }
    
    private func setUpItemImageViewConstraints() {
        itemImageView.widthAnchor.constraint(lessThanOrEqualToConstant: screenWidth).isActive = true
        itemImageView.heightAnchor.constraint(lessThanOrEqualToConstant: screenWidth).isActive = true
        itemImageView.widthAnchor.constraint(equalTo: itemImageView.heightAnchor).isActive = true
    }
    
    private func setUpSaveButtonConstraints() {
        saveButton.heightAnchor.constraint(equalToConstant: screenHeight * 0.06).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: screenWidth * 0.8).isActive = true
    }
}

// MARK: - ImagePicker Delegate
extension AddNewItemToListViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        itemImageView.image = image
        dismiss(animated: true)
    }
}
