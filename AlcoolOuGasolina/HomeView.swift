//
//  HomeView.swift
//  AlcoolOuGasolina
//
//  Created by Raline Maria da Silva on 29/01/23.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func calcularCombustivel()
}

class HomeView: UIView {
    
    weak var delegate: HomeViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Descubra qual é o melhor combustível!"
        label.font = UIFont(name: "GillSans-Bold", size: 17)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var alcoolLabel: UILabel = {
        let label = UILabel()
        label.text = "Preço do Alcool: "
        label.font = UIFont(name: "GillSans-Bold", size: 17)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    public lazy var priceAlcool: UITextField = {
        let textField = UITextField()
        textField.placeholder =  "R$ 0.0"
        textField.font = .systemFont(ofSize: 15, weight: .bold)
        textField.textColor = .white
        textField.keyboardType = .decimalPad
        textField.addDoneButtonOnKeyboard()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var gasolinaLabel: UILabel = {
        let label = UILabel()
        label.text = "Preço da Gasolina: "
        label.font = UIFont(name: "GillSans-Bold", size: 17)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var priceGasolina: UITextField = {
        let textField = UITextField()
        textField.placeholder = "R$ 0.0"
        textField.font = .systemFont(ofSize: 15, weight: .bold)
        textField.textColor = .white
        textField.keyboardType = .decimalPad
        textField.addDoneButtonOnKeyboard()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var buttonCalcular: UIButton = {
        let button = UIButton()
        button.setTitle("Calcular", for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(calcular), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, alcoolLabel, priceAlcool, gasolinaLabel, priceGasolina])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func calcular() {
        delegate?.calcularCombustivel()
    }
    
    func addSubViews() {
        addSubview(stackView)
        addSubview(buttonCalcular)
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            buttonCalcular.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            buttonCalcular.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            buttonCalcular.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            buttonCalcular.heightAnchor.constraint(equalToConstant: 48),
            buttonCalcular.widthAnchor.constraint(equalToConstant: 312)
        ])
    }
}
