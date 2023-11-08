//
//  ViewController.swift
//  ConcurrencyHw7
//
//  Created by Andria Inasaridze on 08.11.23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        Task {
            await findWinnerThread()
        }
    }
    
    func generateRandomNumber() -> Int {
        Int.random(in: 20...50)
    }
    
    func calculateFactorial(of number: Int) -> Decimal {
        if number == 0 {
            return 1
        }
        var result: Decimal = 1
        for i in 1...number {
            result *= Decimal(i)
        }
        return result
    }
    
    // asynchronous factorial calculation
    func calculateFactorialAsync(number: Int) async -> Decimal {
        calculateFactorial(of: number)
    }
    
    func findWinnerThread() async {
        let number1 = generateRandomNumber()
        let number2 = generateRandomNumber()
        var factorial1: Decimal = 0
        var factorial2: Decimal = 0
        
        let clock = ContinuousClock()
        
        let time1 = await clock.measure {
            factorial1 = await calculateFactorialAsync(number: number1)
        }
        
        let time2 = await clock.measure {
            factorial2 = await calculateFactorialAsync(number: number2)
        }
        
        var winnerThread = ""
        if time1 < time2 {
            winnerThread = "Thread 1"
        } else if time1 > time2 {
            winnerThread = "Thread 2"
        } else {
            winnerThread = "Both(Tie)"
        }
        
        print("Factorial of \(number1) is \(factorial1), execution time: \(time1)\n")
        print("Factorial of \(number2) is \(factorial2), execution time: \(time2)\n")
        print("Winner Thread is: \(winnerThread)")
    }
}

