//
//  ResultViewController.swift
//  AlcoolOuGasolina
//
//  Created by Raline Maria da Silva on 29/01/23.
//

import UIKit

enum Choice: String {
    case gasolina = "Gasolina"
    case alcool = "Alcool"
}

class ResultViewController: UIViewController {
    
    var homeView: HomeView?
    var result: ResultView?
    let choice: Choice?
    
    init(choice: Choice) {
        self.choice = choice
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        result = ResultView()
        view = result
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkBackground
        result?.resultLabel.text = choice?.rawValue
        result?.delegate = self
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}

extension ResultViewController: ResultViewDelegate {
    func backButton() {
        popViewController()
    }
    
    func calculateButton() {
        popViewController()
    }

}
