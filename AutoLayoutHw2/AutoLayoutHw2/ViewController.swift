//
//  ViewController.swift
//  AutoLayoutHw2
//
//  Created by Andria Inasaridze on 25.10.23.
//

import UIKit

/*
 ui ორივენაირად მოვსინჯე გაკეთება, StackView ებითაც და constraint ებითაც.
 ორივე საწვალებელი იყო constraint ები მითუმეტეს, მაგრამ constraint ები უფრო მეტ
 კონტროლს მაძლევდა კომპონენტებს შორის spacing ში, ყველანაირად ვეცადე რომ ამის მიუხედავად
 ყველა ეკრანზე მორგებადი ui გამეკეთებინა და მგონი გამომივიდა +-, მაგრამ გამიჭირდა ყველა ეკრანზე
 კომპონენტების თანაბრად დალაგება, მაგალითად iphone15 pro max ზე buy now ღილაკის ქვემოთ თეთრი ადგილი რჩებოდა,
 ხოლო ეს პრობლემა StackView თი ბევრად მარტივად გადაიჭრა.
 სამაგიეორდ StackView -ს გამოყენებამ ეგ ის კონტროლი შემიზღუდა ასე თუ ისე, რომ კომპონენტები ყველა სხვადასხვა
 მანძილით დამეშორებინა.
 საბოლოო ვერსიად StackView გამოვიყენე, მაგრამ Storyboard ებში Constraint ების ვერსიაც არის მაინც,
 დამენანა ამდენი ნაწვალების წაშლა :D
 */

final class ViewController: UIViewController {
    @IBOutlet private weak var coffeeImageView: UIImageView!
    @IBOutlet private weak var sButtonLabel: UIButton!
    @IBOutlet private weak var mButtonLabel: UIButton!
    @IBOutlet private weak var lButtonLabel: UIButton!
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var productBonusComponentLabel: UILabel!
    @IBOutlet private weak var productPriceLabel: UILabel!
    @IBOutlet private weak var productRatingLabel: UILabel!
    @IBOutlet private weak var productDescriptionLabel: UILabel!
    
    private let coffeeModel = Coffee(productName: "Espresso", price: 5.97, rating: 4.99, bonusComponent: "Sugar", Description: "espresso is a concentrated form of coffee brewed with high pressure, hot water and finely ground coffee beans. Espresso is thicker than regular coffee and has a layer of crema on top, which results from air bubbles mixing with the coffee's oils")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coffeeImageCornerRadius()
        addCoffeeModel(coffeeModel: coffeeModel)
    }

    @IBAction private func sizeButtonPressed(_ sender: UIButton) {
        resetSizeButtonColor()
        sender.layer.borderColor = UIColor(red: 0.776, green: 0.486, blue: 0.306, alpha: 1).cgColor
        sender.layer.backgroundColor = UIColor(red: 1, green: 0.959, blue: 0.933, alpha: 1).cgColor
    }
    
    private func coffeeImageCornerRadius(cornerRadius: CGFloat = 16) {
        // Set the corner radius and enable clipsToBounds
        coffeeImageView.layer.cornerRadius = cornerRadius
        coffeeImageView.clipsToBounds = true
    }
    
    private func resetSizeButtonColor() {
        sButtonLabel.layer.borderColor = UIColor(red: 0.871, green: 0.871, blue: 0.871, alpha: 1).cgColor
        mButtonLabel.layer.borderColor = UIColor(red: 0.871, green: 0.871, blue: 0.871, alpha: 1).cgColor
        lButtonLabel.layer.borderColor = UIColor(red: 0.871, green: 0.871, blue: 0.871, alpha: 1).cgColor
        
        sButtonLabel.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        mButtonLabel.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        lButtonLabel.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor

    }
    
    private func addCoffeeModel(coffeeModel: Coffee) {
        productNameLabel.text = coffeeModel.productName
        productPriceLabel.text = "$\(coffeeModel.price)"
        productRatingLabel.text = "\(coffeeModel.rating)"
        productBonusComponentLabel.text = "With \(coffeeModel.bonusComponent)"
        productDescriptionLabel.text = coffeeModel.Description
    }
}

