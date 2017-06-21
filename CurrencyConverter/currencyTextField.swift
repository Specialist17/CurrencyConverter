//
//  currencyTextField.swift
//  CurrencyConverter
//
//  Created by Fernando on 6/21/17.
//  Copyright © 2017 Specialist. All rights reserved.
//

import UIKit

class currencyTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        layer.borderColor = ((UIColor(red: 255/255, green: 214/255, blue: 0/255, alpha: 1.0)).cgColor);
        layer.borderWidth = 1
        layer.backgroundColor = ((UIColor(red: 255/255, green: 214/255, blue: 0/255, alpha: 0.0)).cgColor)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
