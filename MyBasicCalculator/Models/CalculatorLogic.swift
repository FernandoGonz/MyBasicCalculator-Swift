//
//  CalculatorLogic.swift
//  MyBasicCalculator
//
//  Created by Fernando González on 16/06/22.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        if var n = self.number {
            switch symbol {
            case "+/-":
                n *= -1
                return n
            case "AC":
                n = 0
                return n
            case "%":
                n *= 0.01
                return n
            default:
                print("Unespected Symbol!")
            }
        }
        return nil
    }
}
