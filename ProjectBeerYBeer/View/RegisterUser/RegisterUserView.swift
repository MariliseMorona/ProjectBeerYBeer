//
//  RegisterView.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 14/05/22.
//

import UIKit

class RegisterUserView: UIView {

    lazy var stackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTextField, emailTextField, passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    let nameTextField = UITextField.textField(placeholder: "Insira seu nome", backgroundColor: .backgroundColorWhite, textColor: .backgroundColorGrayLight)

    let emailTextField = UITextField.textField(placeholder: "Insira seu e-mail", backgroundColor: .backgroundColorWhite, textColor: .backgroundColorGrayLight)

    let passwordTextField = UITextField.textField(placeholder: "Crie uma senha forte", backgroundColor: .backgroundColorWhite, textColor: .backgroundColorGrayLight)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUp(){
        addSubview(stackView)
        constraintLayout()
        
    }
    
    private func constraintLayout(){
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        nameTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
}

extension RegisterUserView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.endEditing(true)
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

