//
//  ResultView.swift
//  AlcoolOuGasolina
//
//  Created by Raline Maria da Silva on 29/01/23.
//

import UIKit

protocol ResultViewDelegate: AnyObject {
    func backButton()
    func calculateButton()
}

class ResultView: UIView {
    
    weak var delegate: ResultViewDelegate?
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Botão Back"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "É melhor abastecer com: "
        label.font = UIFont(name: "GillSans-Bold", size: 25)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = UIColor(red: 30/255, green: 31/255, blue: 41/255, alpha: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.font = UIFont(name: "GillSans-Bold", size: 42)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var buttonCalcular: UIButton = {
        let button = UIButton()
        button.setTitle("Calcular Novamente", for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedBackButton() {
        delegate?.backButton()
    }
    
    @objc func tappedCalculateButton() {
        delegate?.calculateButton()
    }
    
    func addSubViews() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(resultLabel)
        addSubview(buttonCalcular)
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonCalcular.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 60),
            buttonCalcular.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            buttonCalcular.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            buttonCalcular.heightAnchor.constraint(equalToConstant: 48),
            buttonCalcular.widthAnchor.constraint(equalToConstant: 312)
        ])
    }
}
