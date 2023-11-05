//
//  LoginViewController.swift
//  SecureNotesAppHw6
//
//  Created by Andria Inasaridze on 05.11.23.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Class Properties
    enum DefaultsKey: String, CaseIterable {
        case userCredentials
    }
    
    // MARK: - UI Components
    private let mainVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.borderColor = UIColor.gray.cgColor
        // Add left padding to the text field
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.isSecureTextEntry = true
        // Add left padding to the text field
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
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
        setupSignInButton()
    }
    
    private func setupSubViews() {
        view.addSubview(mainVStack)
        
        mainVStack.addArrangedSubview(usernameTextField)
        mainVStack.addArrangedSubview(passwordTextField)
        mainVStack.addArrangedSubview(signInButton)
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBlue
    }
    
    private func setupSignInButton() {
        signInButton.addAction(UIAction(handler: { [weak self] action in
            self?.signInButtonTapped()
        }), for: .touchUpInside)
    }
    
    private func signInButtonTapped() {
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        if username == "" || password == "" {
            displayAlert(title: "Empty Fields", message: "Input Username and Password!")
            return
        }
        
        let userDefaultKey = "\(username)\(password)"
        
        var isNotFirstTimeUser = UserDefaults.standard.bool(forKey: "\(username)\(password)")
        
        if isNotFirstTimeUser {
            guard let retrievedPassword = KeychainManager.shared.getPassword(username: username) else {
                return
            }
            if password == retrievedPassword {
                let nextVC = NoteListViewController(username: username, password: password)
                navigationController?.pushViewController(nextVC, animated: true)
                displayAlert(title: "Congratulation! You Logged In", message: "username: \(username)")
            }
        } else {
            // first time user
            isNotFirstTimeUser = true
            UserDefaults.standard.setValue(isNotFirstTimeUser, forKey: userDefaultKey)
            do {
                try KeychainManager.shared.save(username: username, password: password)
                let nextVC = NoteListViewController(username: username, password: password)
                navigationController?.pushViewController(nextVC, animated: true)
                displayAlert(title: "Hello! First Time User", message: "Username: \(username)")
            } catch {
                print(error)
                displayAlert(title: "Input Unique Username", message: "username: \(username) is taken")
            }
        }
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupMainVStackConstraints()
        setupUsernameTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupSignInButtonConstraints()
    }
    
    private func setupMainVStackConstraints() {
        mainVStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainVStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupUsernameTextFieldConstraints() {
        usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
    }
    
    private func setupPasswordTextFieldConstraints() {
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
    }
    
    private func setupSignInButtonConstraints() {
        signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.09).isActive = true
    }
    
    // MARK: - Class Methods
    private func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}

