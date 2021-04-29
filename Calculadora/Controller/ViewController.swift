//
//  ViewController.swift
//  Calculadora
//
//  Created by Cassia Franco on 27/03/21.
//  Copyright © 2021 Cassia Franco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private func button(name: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = color
        button.setTitleColor(.black, for: .normal) // colocar uma cor no texto
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30) // tamanho da fonte
    
        
        button.addConstraint(NSLayoutConstraint(item: button,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: button,
                                                attribute: .width,
                                                multiplier: 1 / 1,
                                                constant: 0))
        button.setTitle(name, for: .normal)
        return button
    }
    
    private let zero: UILabel = {
        let lb = UILabel()
        
        lb.text = "0" // texto padrao
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white // Cor na fonte
        lb.font = UIFont.systemFont(ofSize: 80) // tamanho da fonte
        lb.textAlignment = .right
        return lb
    }()
    
    private lazy var ac: UIButton = {
        return button(name: "AC", color: .gray)
    }()
    
    private func newLine(_ rootStack: UIStackView) -> UIStackView {
        let line = UIStackView()
                 
        rootStack.addArrangedSubview(line)
        let margins = view.layoutMarginsGuide
        line.axis = .horizontal
        line.spacing = 2 // espaço entre a stack view horizontal
               
        line.translatesAutoresizingMaskIntoConstraints = false
        
        line.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        line.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        return line // retorno da Stack horizontal
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let margins = view.layoutMarginsGuide
    
        let rootStack = UIStackView()
        view.addSubview(rootStack)
        rootStack.axis = .vertical
        rootStack.spacing = 2 // espaço entre a stack vertical
        rootStack.distribution = .fillEqually // Faz a distribuicao por igual
        
        rootStack.translatesAutoresizingMaskIntoConstraints = false
        rootStack.leadingAnchor.constraint(equalTo: margins.leadingAnchor ).isActive = true
        rootStack.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        rootStack.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        let line0 = newLine(rootStack)
        line0.addArrangedSubview(zero)
        
        let line1 = newLine(rootStack)
        line1.addArrangedSubview(ac)
        line1.addArrangedSubview(button(name: "+/-", color: .gray))
        line1.addArrangedSubview(button(name: "%", color: .gray))
        line1.addArrangedSubview(button(name: "÷", color: .orange))
        
        let line2 = newLine(rootStack)
          
        line2.addArrangedSubview(button(name: "7", color: .lightGray))
        line2.addArrangedSubview(button(name: "8", color: .lightGray))
        line2.addArrangedSubview(button(name: "9", color: .lightGray))
        line2.addArrangedSubview(button(name: "×", color: .orange))
        
        let line3 = newLine(rootStack)
        line3.addArrangedSubview(button(name: "4", color: .lightGray))
        line3.addArrangedSubview(button(name: "5", color: .lightGray))
        line3.addArrangedSubview(button(name: "6", color: .lightGray))
        line3.addArrangedSubview(button(name: "-", color: .orange))
        
        let line4 = newLine(rootStack)
        line4.addArrangedSubview(button(name: "1", color: .lightGray))
        line4.addArrangedSubview(button(name: "2", color: .lightGray))
        line4.addArrangedSubview(button(name: "3", color: .lightGray))
        line4.addArrangedSubview(button(name: "+", color: .orange))
        
        let line5 = newLine(rootStack)
        let lineLeft = UIStackView()
        line5.addArrangedSubview(lineLeft) // View na tela
        lineLeft.axis = .horizontal // eixo em horinzontal
        lineLeft.spacing = 2 // espaco entre as stack
        
        let b = button(name: "0", color: .lightGray) // criando o botao
        b.removeConstraints(b.constraints)// removendo as contraints
        lineLeft.addArrangedSubview(b)
        
        let lineRigth = UIStackView()
        line5.addArrangedSubview(lineRigth)
        lineRigth.axis = .horizontal
        lineRigth.spacing = 2
        
        let coma = button(name: "," , color: .lightGray)
        lineRigth.addArrangedSubview(coma)
        lineRigth.addArrangedSubview(button(name: "=", color: .orange ))
         
    }
    
}

