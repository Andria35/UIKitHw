//
//  HomePageVC.swift
//  NavigationHw3
//
//  Created by Andria Inasaridze on 27.10.23.
//

import UIKit

protocol ChangeColorPaletteDelegate {
    func changeScreenBackgroundColor(backgroundColor: UIColor)
    func changeButtonBackgroundColor(buttonColor: UIColor)
}

final class HomePageVC: UIViewController {

    private let mainVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()
    
    private let presentColorPaletteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present Colour palette page", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        button.titleLabel?.textColor = .white
        button.backgroundColor = UIColor(red: 0.133, green: 0.341, blue: 0.478, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 292).isActive = true
        return button
    }()
    
    private let pushColorPaletteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push Colour palette page", for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 15)
        button.titleLabel?.textColor = .white
        button.backgroundColor = UIColor(red: 0.133, green: 0.341, blue: 0.478, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 292).isActive = true
        return button
    }()
    
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpMainVStack()
        
        // add actions to buttons
        pushColorPaletteButton.addAction(UIAction(handler: { [weak self] action in
            self?.pushToColorPalette()
        }), for: .touchUpInside)
        
        presentColorPaletteButton.addAction(UIAction(handler: { [weak self] action in
            self?.presentColorPalette()
        }), for: .touchUpInside)

    }
    
    // MARK: - Navigation
    private func pushToColorPalette() {
        let colorPalette = ColorPaletteVC()
        
        // delegate
        colorPalette.delegate = self
        navigationController?.pushViewController(colorPalette, animated: true)
    }
    
    private func presentColorPalette() {
        let colorPalette = ColorPaletteVC()
        
        // delegate
        colorPalette.delegate = self
        present(colorPalette, animated: true)
    }
    
    // MARK: - Set Up UI
    private func setUpMainVStack() {
        // add items in stack
        mainVStack.addArrangedSubview(presentColorPaletteButton)
        mainVStack.addArrangedSubview(pushColorPaletteButton)
        // add stackView to superView
        view.addSubview(mainVStack)
        // position VStack in center
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainVStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainVStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension HomePageVC: ChangeColorPaletteDelegate {
    func changeScreenBackgroundColor(backgroundColor: UIColor) {
        view.backgroundColor = backgroundColor
    }
    
    func changeButtonBackgroundColor(buttonColor: UIColor) {
        presentColorPaletteButton.backgroundColor = buttonColor
        pushColorPaletteButton.backgroundColor = buttonColor
    }
}
