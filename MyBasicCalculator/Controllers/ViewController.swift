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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Non-Number button is pressed
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        self.isFinishedTypingNumber = true
        
        guard let number = Double(self.displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double")
        }
        
        if let operation = sender.currentTitle {
            switch operation {
            case "+/-":
                self.displayLabel.text = String(number * -1)
            case "AC":
                self.displayLabel.text = "0"
            case "%":
                self.displayLabel.text = String(number * 0.01)
            default:
                <#code#>
            }
        }
        
    }
    
    // MARK: - Number is entered into the keypad
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let number = sender.currentTitle {
            if isFinishedTypingNumber {
                self.displayLabel.text = number
                self.isFinishedTypingNumber = false
            } else {
                self.displayLabel.text = self.displayLabel.text! + number
            }
        }
        
        
    }
    
    
}

