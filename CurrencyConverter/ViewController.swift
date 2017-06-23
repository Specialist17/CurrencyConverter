//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Fernando on 6/21/17.
//  Copyright © 2017 Specialist. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var amountLabel: UITextField!
    @IBOutlet weak var baseCurrencyType: UILabel!
    
    @IBOutlet weak var convertedLabel: UILabel!
    @IBOutlet weak var convertedCurrencyType: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    let baseCurrencies: [String] = ["USD", "AUD", "CAD", "DUB", "EUR"]
    let currencies: [(String, Double)] = [("USD", 1.00), ("AUD", 1.324), ("DUB", 0.196)]
    
    let compareCurrencies: [String] = ["USD", "AUD", "CAD", "DUB", "EUR"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        print(amountLabel.text!)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TODO: create a function to convert everything to USD
    func toUSD(amount: Double, conversion: Double) -> Double {
        
        return amount/conversion
    }
    
    // TODO: create a function to convert between different currencies
    func convertBetweenCurrencies(amount: Double, currencyTypeBase: Double, currencyTypeConversion: Double) -> String {
        let baseCurrency = self.baseCurrencies[currencyPicker.selectedRow(inComponent: 0)]
        let conversionCurrency = self.compareCurrencies[currencyPicker.selectedRow(inComponent: 1)]
        
        if baseCurrency == "USD" {
            
        } else if conversionCurrency == "USD" {
            return "\(toUSD(amount: Double(amountLabel.text!)!, conversion: 2.5))"
        } else {
            
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return baseCurrencies[row]
        } else {
            return compareCurrencies[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return baseCurrencies.count
        } else {
            return compareCurrencies.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            if amountLabel.text != ""{
                convertedLabel.text = amountLabel.text
                convertedCurrencyType.text = "USD"
            } else{
                convertedLabel.text = "$0.00"
                convertedCurrencyType.text = "USD"
            }
        } else {
            if amountLabel.text != ""{
                let formattedCurrency = String(format: "%.2f", Double(amountLabel.text!)!)
                switch compareCurrencies[row] {
                case "AUD":
                    convertedLabel.text = "\(Double(formattedCurrency)! * 1.324)"
                    convertedCurrencyType.text = "AUD"
                    
                case "CAD":
                    convertedLabel.text = "\(Double(formattedCurrency)! * 1.333)"
                    convertedCurrencyType.text = "CAD"
                    
                case "DUB":
                    convertedLabel.text = "\(Double(formattedCurrency)! * 0.196)"
                    convertedCurrencyType.text = "DUB"
                    
                case "EUR":
                    convertedLabel.text = "\(Double(formattedCurrency)! * 0.896)"
                    convertedCurrencyType.text = "EUR"
                    
                case "USD":
                    convertedLabel.text = "\(Double(formattedCurrency)!)"
                    convertedCurrencyType.text = "USD"
                    
                    
                default:
                    convertedLabel.text = "$0.00"
                    convertedCurrencyType.text = "USD"
                }
            }
        }
    }
    
}

