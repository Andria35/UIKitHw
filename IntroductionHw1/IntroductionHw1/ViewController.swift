//
//  ViewController.swift
//  IntroductionHw1
//
//  Created by Andria Inasaridze on 22.10.23.
//


// Iphone 15 pro Simulator

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculateOption: UILabel!
    @IBOutlet weak var finalResult: UILabel!
    @IBOutlet weak var num1: UITextField!
    @IBOutlet weak var num2: UITextField!
    
    var isGCD: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // CalculateOption Switch
    @IBAction func optionSwitch(_ sender: UISwitch) {
        if sender.isOn {
            calculateOption.text = "GCD(უსგ)"
            isGCD = true
        } else {
            calculateOption.text = "LCM(უსჯ)"
            isGCD = false
        }
    }
    
    // Calculate final result Button
    @IBAction func calculate(_ sender: UIButton) {
        // set colours to default
        num1.backgroundColor = .white
        num2.backgroundColor = .white
        
        // check if input is valid
        guard let stringNum1 = num1.text,
              let intNum1 = Int(stringNum1) else {
            num1.backgroundColor = .red
            // if both num1 and num2 are invalid both of their backgrounds should be red
            if Int(num2.text!) == nil {
                num2.backgroundColor = .red
            }
            return
        }
        
        guard let stringNum2 = num2.text,
              let intNum2 = Int(stringNum2) else {
            num2.backgroundColor = .red
            return
        }
        
        // Calculate GCD or LCM
        if isGCD {
            finalResult.text = "\(findGCD(intNum1, intNum2))"
        } else {
            finalResult.text = "\(findLCM(intNum1, intNum2))"
        }
        
    }
    
    func findGCD(_ a: Int, _ b: Int) -> Int {
        var num1 = a
        var num2 = b
        while num2 != 0 {
            let temp = num2
            num2 = num1 % num2
            num1 = temp
        }
        return abs(num1)
    }
    
    func findLCM(_ a: Int, _ b: Int) -> Int {
        if a == 0 || b == 0 {
            return 0
        }
        let gcd = findGCD(a, b)
        return abs(a * b) / gcd
    }
}

