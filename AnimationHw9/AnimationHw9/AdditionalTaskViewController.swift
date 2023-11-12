//
//  AdditionalTaskViewController.swift
//  AnimationHw9
//
//  Created by Andria Inasaridze on 12.11.23.
//

import UIKit

// ამის გასაშვებად SceneDelegate - ია შესაცვლელი.
final class AdditionalTaskViewController: UIViewController {
    
    // MARK: - UI Components
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "TBC IT Academy"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .light)
        return label
    }()
    
    private let backgroundGradient: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.blue.cgColor,
            UIColor.red.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        return gradientLayer
    }()
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){ [weak self] in
            self?.animateMovement()
            self?.animateGradientColors()
            self?.animateMagnify()
        }
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupBackground()
        setupSubViews()
    }
    
    private func setupBackground() {
//        view.backgroundColor = .white
        backgroundGradient.frame = view.bounds
        view.layer.addSublayer(backgroundGradient)
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
        let spinAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        let initialAngle: CGFloat = 0.0
        spinAnimation.fromValue = initialAngle
        // Set the final rotation angle (in radians)
        let finalAngle: CGFloat = .pi  // 180 degrees in radians
        spinAnimation.toValue = finalAngle
        spinAnimation.duration = 4.0
        spinAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        spinAnimation.repeatCount = .infinity
        spinAnimation.autoreverses = true
        mainLabel.layer.add(spinAnimation, forKey: "spinAnimation")
    }
    
    private func animateGradientColors() {
        let colorAnimation = CABasicAnimation(keyPath: "colors")
        colorAnimation.fromValue = backgroundGradient.colors
        colorAnimation.toValue = [
            UIColor.yellow.cgColor,
            UIColor.green.cgColor
        ]
        colorAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        colorAnimation.duration = 4
        colorAnimation.repeatCount = .infinity
        colorAnimation.autoreverses = true
        backgroundGradient.add(colorAnimation, forKey: "colorAnimation")
    }
    
    private func animateMagnify() {
        let magnifyAnimation = CABasicAnimation(keyPath: "transform.scale")
        let initialScale: CGFloat = 0.1
        magnifyAnimation.fromValue = initialScale
        let finalScale: CGFloat = 1.0
        magnifyAnimation.toValue = finalScale
        magnifyAnimation.duration = 2.0
        magnifyAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        mainLabel.layer.add(magnifyAnimation, forKey: "magnifyAnimation")
    }
}
