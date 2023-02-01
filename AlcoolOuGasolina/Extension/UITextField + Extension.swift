//
//  UITextField + Extension.swift
//  AlcoolOuGasolina
//
//  Created by Raline Maria da Silva on 31/01/23.
//

import UIKit

extension UITextField {
    func addDoneButtonOnKeyboard() {
        let dooneToobar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        dooneToobar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Ok", style: .done, target: self, action: #selector(donneButtonAction))
        
        let items = [flexSpace, done]
        dooneToobar.items = items
        dooneToobar.sizeToFit()
        self.inputAccessoryView = dooneToobar
    }
    
    @objc func donneButtonAction() {
        self.resignFirstResponder()
    }
}

