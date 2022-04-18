//
//  ViewController.swift
//  Calculator
//
//  Created by Roman Hural on 22.01.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Variables
    var currentNumber: Double = 0
    var previousNumber: Double = 0
    var operationResult: String = ""
    var performingMath = false
    
    //MARK: - Outlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var plusminusButton: UIButton!
    @IBOutlet var fractionButton: UIButton!
    @IBOutlet var divideButton: UIButton!
    @IBOutlet var multipleButton: UIButton!
    @IBOutlet var substractButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var equalButton: UIButton!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        enablingOperations()
    }
    
    //MARK: - Methods
    func enablingOperations() {
        if resultLabel.text == "" {
            clearButton.isEnabled = false
            plusminusButton.isEnabled = false
            fractionButton.isEnabled = false
            divideButton.isEnabled = false
            multipleButton.isEnabled = false
            substractButton.isEnabled = false
            addButton.isEnabled = false
            equalButton.isEnabled = false
        } else {
            clearButton.isEnabled = true
            plusminusButton.isEnabled = true
            fractionButton.isEnabled = true
            divideButton.isEnabled = true
            multipleButton.isEnabled = true
            substractButton.isEnabled = true
            addButton.isEnabled = true
            equalButton.isEnabled = true
        }
    }
    
    //MARK: - Actions
    @IBAction func numberTapped(_ sender: UIButton) {
        if performingMath == true {
            resultLabel.text = sender.titleLabel?.text
            currentNumber = Double(resultLabel.text!)!
            performingMath = false
        } else {
        resultLabel.text = resultLabel.text! + (sender.titleLabel?.text)!
        currentNumber = Double(resultLabel.text!)!
        }
        enablingOperations()
    }
    
    @IBAction func operationTapped(_ sender: UIButton) {
        if sender.titleLabel?.text != "Clear" && sender.titleLabel?.text != "=" && sender.titleLabel?.text != "." {
            previousNumber = Double(resultLabel.text!)!
            if sender.titleLabel?.text == "%" {
                resultLabel.text = "%"
            } else if sender.titleLabel?.text == "÷" {
                resultLabel.text = "÷"
            } else if sender.titleLabel?.text == "x" {
                resultLabel.text = "x"
            } else if sender.titleLabel?.text == "-" {
                resultLabel.text = "-"
            } else if sender.titleLabel?.text == "+" {
                resultLabel.text = "+"
            } else if sender.titleLabel?.text == "+/-" {
                if previousNumber > 0 || currentNumber > 0 {
                    resultLabel.text = String(-previousNumber)
            }
            }
            operationResult = (sender.titleLabel?.text!)!
            performingMath = true
        } else if sender.titleLabel?.text == "=" {
            if operationResult == "%" {
                resultLabel.text = String(Int(previousNumber) % Int(currentNumber))
            } else if operationResult == "÷" {
                resultLabel.text = String(previousNumber / currentNumber)
            } else if operationResult == "x" {
                resultLabel.text = String(previousNumber * currentNumber)
            } else if operationResult == "-" {
                resultLabel.text = String(previousNumber - currentNumber)
            } else if operationResult == "+" {
                resultLabel.text = String(previousNumber + currentNumber)
            }
        } else if sender.titleLabel?.text == "Clear" {
            resultLabel.text = ""
            previousNumber = 0
            currentNumber = 0
            operationResult = ""
            enablingOperations()
        }
    }
    
}

