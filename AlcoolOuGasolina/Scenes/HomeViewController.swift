//
//  HomeViewController.swift
//  AlcoolOuGasolina
//
//  Created by Raline Maria da Silva on 29/01/23.
//

import UIKit

class HomeViewController: UIViewController {

    var homeView: HomeView?
    
    override func loadView() {
        homeView = HomeView()
        view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView?.delegate = self
        view.backgroundColor = .lightBackground
    }
    
    func validationTextField() -> Bool {
        guard let precoAlcool = homeView?.priceAlcool.text else { return false }
        guard let precoGasolina = homeView?.priceGasolina.text else { return false }
        
        if precoAlcool.isEmpty && precoGasolina.isEmpty {
            self.showAlertInformation(title: "Atenção!", message: "É necessário informar os valores dos combustivéis!")
            return false
        } else if precoAlcool.isEmpty {
            self.showAlertInformation(title: "Atenção!", message: "É necessário informar o valor do Alcool.")
            return false
            
        } else if precoGasolina.isEmpty {
            self.showAlertInformation(title: "Atenção!", message: "É necessário informar o valor da gasolina.")
            return false
        }
        
        return true
    }

}

extension HomeViewController: HomeViewDelegate {
    func calcularCombustivel() {
        if validationTextField() {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            let precoAlcool: Double = (formatter.number(from: homeView?.priceAlcool.text ?? "0.0") as? Double) ?? 0.0
            let precoGasolina: Double = (formatter.number(from: homeView?.priceGasolina.text ?? "0.0") as? Double) ?? 0.0
            
            var controller: ResultViewController?
            if precoAlcool / precoGasolina >= 0.7 {
                controller = ResultViewController(choice: .gasolina)
            } else {
                controller = ResultViewController(choice: .alcool)
            }
            navigationController?.pushViewController(controller ?? UIViewController(), animated: true)
            
        }
        
    }

}
