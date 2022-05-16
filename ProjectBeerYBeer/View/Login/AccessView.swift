//
//  LoginView.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit

class AccessView: UIView {

    lazy var stackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userNameTextField, dividerView, passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    let userNameTextField = UITextField.textField(placeholder: "Login", backgroundColor: .backgroundColorWhite, textColor: .backgroundColorGrayLight)
    lazy var dividerView : UIView = {
        let dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .backgroundColorGradyMed
        return dividerView
    }()
    let passwordTextField = UITextField.textField(placeholder: "Password", backgroundColor: .backgroundColorWhite, textColor: .backgroundColorGrayLight)

    override init(frame: CGRect) {
        super.init(frame: frame)
        passwordTextField.isSecureTextEntry = true
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
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        userNameTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
}

extension AccessView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

