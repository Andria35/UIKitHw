//
//  ColorPaletteVC.swift
//  NavigationHw3
//
//  Created by Andria Inasaridze on 27.10.23.
//

import UIKit

final class ColorPaletteVC: UIViewController {

    var delegate: ChangeColorPaletteDelegate?
    
    private let mainVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let changeHomeButtonsColorVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let changeHomeScreenColorVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let homeButtonColorLabel: UILabel = {
        let label = UILabel()
        label.text = "Change Home Buttons Background Colors:"
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let homeScreenColorLabel: UILabel = {
        let label = UILabel()
        label.text = "Change Home Background Color:"
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set background colour
        view.backgroundColor = .white
        
        setUpMainVStack()
    }
    
    // MARK: - Set Up UI
    private func setUpMainVStack() {
        // setup stack items
        setUpChangeHomeScreenColorVStack()
        setUpChangeHomeButtonsColorVStack()
        
        // add items in stack
        mainVStack.addArrangedSubview(changeHomeButtonsColorVStack)
        mainVStack.addArrangedSubview(changeHomeScreenColorVStack)
        
        // add stackView to superView
        view.addSubview(mainVStack)
        
        // position VStack in center
        mainVStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainVStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainVStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    /*
     რადგან 12 ერთნაირი ღილაკი უნდა შეგვექმნა, იმისთვის რომ 12 ვე ცალცალკე არ შემექმნა ვეცადე, რომ
     ფუნქციების და closure ების გამოყენებით reusable კოდი გამეკეთებინა, მაგრამ რაც გამომივიდა ისიც
     საკმარისად დიდ მონსტრს გავს... ამ მეთოდმა გაადვილა და მართლა შეამოკლა კოდი,
     თუ პირიქით გააუარესა. საკითხავი აი ეს არის.....
     */
    private func setUpChangeHomeButtonsColorVStack() {
        // add items in stack
        changeHomeButtonsColorVStack.addArrangedSubview(homeButtonColorLabel)
        changeHomeButtonsColorVStack.addArrangedSubview(createButton(buttonColor: .red){ [weak self] color in
            self?.delegate?.changeButtonBackgroundColor(buttonColor: color)
        })
        changeHomeButtonsColorVStack.addArrangedSubview(createButton(buttonColor: .blue){ [weak self] color in
            self?.delegate?.changeButtonBackgroundColor(buttonColor: color)
        })
        changeHomeButtonsColorVStack.addArrangedSubview(createButton(buttonColor: .brown){ [weak self] color in
            self?.delegate?.changeButtonBackgroundColor(buttonColor: color)
        })
        changeHomeButtonsColorVStack.addArrangedSubview(createButton(buttonColor: .green){ [weak self] color in
            self?.delegate?.changeButtonBackgroundColor(buttonColor: color)
        })
        changeHomeButtonsColorVStack.addArrangedSubview(createButton(buttonColor: .purple){ [weak self] color in
            self?.delegate?.changeButtonBackgroundColor(buttonColor: color)
        })
        changeHomeButtonsColorVStack.addArrangedSubview(createButton(buttonColor: .orange){ [weak self] color in
            self?.delegate?.changeButtonBackgroundColor(buttonColor: color)
        })
    }
    
    private func setUpChangeHomeScreenColorVStack() {
        // add items in stack
        changeHomeScreenColorVStack.addArrangedSubview(homeScreenColorLabel)
        changeHomeScreenColorVStack.addArrangedSubview(createButton(buttonColor: .red){ [weak self] color in
            self?.delegate?.changeScreenBackgroundColor(backgroundColor: color)
        })
        changeHomeScreenColorVStack.addArrangedSubview(createButton(buttonColor: .blue){ [weak self] color in
            self?.delegate?.changeScreenBackgroundColor(backgroundColor: color)
        })
        changeHomeScreenColorVStack.addArrangedSubview(createButton(buttonColor: .brown){ [weak self] color in
            self?.delegate?.changeScreenBackgroundColor(backgroundColor: color)
        })
        changeHomeScreenColorVStack.addArrangedSubview(createButton(buttonColor: .green){ [weak self] color in
            self?.delegate?.changeScreenBackgroundColor(backgroundColor: color)
        })
        changeHomeScreenColorVStack.addArrangedSubview(createButton(buttonColor: .purple){ [weak self] color in
            self?.delegate?.changeScreenBackgroundColor(backgroundColor: color)
        })
        changeHomeScreenColorVStack.addArrangedSubview(createButton(buttonColor: .orange){ [weak self] color in
            self?.delegate?.changeScreenBackgroundColor(backgroundColor: color)
        })
    }
    
    private func createButton(buttonColor: UIColor, withAction changeColor: @escaping (UIColor) -> Void) -> UIButton {
        let button = UIButton()
        button.backgroundColor = buttonColor
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 292).isActive = true
        button.layer.cornerRadius = 15
        button.addAction(UIAction(handler: { [weak self] action in
            changeColor(buttonColor)
            // dismiss screen
            self?.dismiss(animated: true)
            self?.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)
        return button
    }
}
