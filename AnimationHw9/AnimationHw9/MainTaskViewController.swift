//
//  MainTaskViewController.swift
//  AnimationHw9
//
//  Created by Andria Inasaridze on 12.11.23.
//

import UIKit

final class MainTaskViewController: UIViewController {
    
    // MARK: - UI Components
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "TBC IT Academy"
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 25)
        label.layer.opacity = 0
        return label
    }()
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){ [weak self] in
            self?.animateMovement()
            self?.animateOpacity()
        }
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupSubViews()
        setupBackground()
    }
    
    private func setupBackground() {
        view.backgroundColor = .white
    }
    
    private func setupSubViews() {
        view.addSubview(mainLabel)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        setupMainLabelConstraints()
    }
    
    private func setupMainLabelConstraints() {
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func animateMovement() {
        let jumpAnimation = CABasicAnimation(keyPath: "position.y")
        let initialY = mainLabel.layer.position.y
        jumpAnimation.fromValue = initialY
        let jumpHeight: CGFloat = 40
        jumpAnimation.toValue = initialY - jumpHeight
        jumpAnimation.duration = 2
        jumpAnimation.repeatCount = .infinity
        jumpAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        jumpAnimation.autoreverses = true
        mainLabel.layer.add(jumpAnimation, forKey: "jumpAnimation")
    }
    
    private func animateOpacity() {
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = mainLabel.layer.opacity
        opacityAnimation.toValue = 1
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        opacityAnimation.duration = 2
        opacityAnimation.repeatCount = .infinity
        opacityAnimation.autoreverses = true
        mainLabel.layer.add(opacityAnimation, forKey: "opacityAnimation")
    }
}

