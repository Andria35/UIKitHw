//
//  SignInVC.swift
//  NavigationHw3
//
//  Created by Andria Inasaridze on 27.10.23.
//

import UIKit

final class SignInVC: UIViewController {

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let mainVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let signInImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "SignInImageView")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.font = .boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let authenticationVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 53).isActive = true // Increase the height
        textField.widthAnchor.constraint(equalToConstant: 289).isActive = true // Increase the height
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
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 53).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 289).isActive = true
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.layer.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1).cgColor
        textField.layer.borderColor = UIColor(red: 0.698, green: 0.698, blue: 0.698, alpha: 0.25).cgColor
        
        // Add left padding to the text field
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.size.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    private let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Forgot Your Password?"
        label.textColor = UIColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 1)
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        button.titleLabel?.textColor = .white
        button.backgroundColor = UIColor(red: 0.133, green: 0.341, blue: 0.478, alpha: 1)
        button.layer.cornerRadius = 20
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 292).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let separatorHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let firstSeparatorLine: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.widthAnchor.constraint(equalToConstant: 120).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let separatorOrLabel: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.textColor = .lightGray
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondSeparatorLine: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.widthAnchor.constraint(equalToConstant: 120).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let socialMediaHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 23
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let googleIconButton: UIButton = {
        let button = UIButton()
        let googleIcon = UIImage(named: "GoogleIcon")
        button.setImage(googleIcon, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let facebookIconButton: UIButton = {
        let button = UIButton()
        let googleIcon = UIImage(named: "FacebookIcon")
        button.setImage(googleIcon, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let linkedInIconButton: UIButton = {
        let button = UIButton()
        let googleIcon = UIImage(named: "LinkedInIcon")
        button.setImage(googleIcon, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let signUpHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let noAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don’t have an account."
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.textColor = UIColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackground()
        setUpMainVStack()
        
        // Add Target to sign In button
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)

    }
    // MARK: - Navigation
    private func pushToHomePage() {
        navigationController?.pushViewController(HomePageVC(), animated: true)
    }
    
    // MARK: - Button Action
    @objc private func signInButtonTapped() {
        // Check if emailTextField and passwordTextField are not empty
        if let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty {
            // Both fields are not empty
            pushToHomePage()
        } else {
            // One or both fields are empty
            print("Email and Password fields must not be empty.")
        }
    }
    
    // MARK: - Set Up UI
    private func setUpBackground() {
        view.backgroundColor = .white
        view.addSubview(backgroundImageView)
        // Add Auto Layout constraints to position backgroundImageView at the top of the screen
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setUpMainVStack() {
        // setup stack items
        setUpAuthenticationVStack()
        setUpSeparatorHStack()
        setUpSocialMediaHStack()
        setUpSignUpHStack()
        
        // add items in stack
        mainVStack.addArrangedSubview(signInImageView)
        mainVStack.addArrangedSubview(signUpLabel)
        mainVStack.addArrangedSubview(authenticationVStack)
        mainVStack.addArrangedSubview(signInButton)
        mainVStack.addArrangedSubview(separatorHStack)
        mainVStack.addArrangedSubview(socialMediaHStack)
        mainVStack.addArrangedSubview(signUpHStack)
        // add stackView to superView
        view.addSubview(mainVStack)
        // position VStack in center
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainVStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainVStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setUpAuthenticationVStack() {
        // add items in stack
        authenticationVStack.addArrangedSubview(emailTextField)
        authenticationVStack.addArrangedSubview(passwordTextField)
        authenticationVStack.addArrangedSubview(forgotPasswordLabel)
    }
    
    private func setUpSeparatorHStack() {
        // add items in stack
        separatorHStack.addArrangedSubview(firstSeparatorLine)
        separatorHStack.addArrangedSubview(separatorOrLabel)
        separatorHStack.addArrangedSubview(secondSeparatorLine)
    }
    
    private func setUpSocialMediaHStack() {
        //add items in stack
        socialMediaHStack.addArrangedSubview(googleIconButton)
        socialMediaHStack.addArrangedSubview(facebookIconButton)
        socialMediaHStack.addArrangedSubview(linkedInIconButton)
    }
    
    private func setUpSignUpHStack() {
        // add items in stack
        signUpHStack.addArrangedSubview(noAccountLabel)
        signUpHStack.addArrangedSubview(signUpButton)
    }
}
