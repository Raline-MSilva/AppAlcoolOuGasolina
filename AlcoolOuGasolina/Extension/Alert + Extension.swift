//
//  Alert + Extension.swift
//  AlcoolOuGasolina
//
//  Created by Raline Maria da Silva on 29/01/23.
//

import UIKit

extension UIViewController {
    
    func showAlertInformation(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okButton)
        self.present(alertController, animated: true)
    }
    
}
