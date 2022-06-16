//
//  ViewController.swift
//  MyBasicCalculator
//
//  Created by Fernando González on 14/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(self.displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double!")
            }
            return number
        }
        set {
            self.displayLabel.text = String(newValue)
        }
    }
    
    private var calculator: CalculatorLogic = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }
    
    // MARK: - Non-Number button is pressed
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        self.isFinishedTypingNumber = true
        
        if let operation = sender.currentTitle {
            
            self.calculator.setNumber(self.displayValue)
            
            guard let result = self.calculator.calculate(symbol: operation) else {
                fatalError("Cannot calculate")
            }
            
            self.displayValue = result
        }
        
    }
    
    // MARK: - Number is entered into the keypad
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let number = sender.currentTitle {
            if isFinishedTypingNumber {
                self.displayLabel.text = number
                self.isFinishedTypingNumber = false
            } else {
                
                if number == "." {
                    let isInt: Bool = floor(self.displayValue) == self.displayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                self.displayLabel.text = self.displayLabel.text! + number
            }
        }
    }
}

