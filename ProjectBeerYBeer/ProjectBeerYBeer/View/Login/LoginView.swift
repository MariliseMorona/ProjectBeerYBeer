//
//  LoginView.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 02/05/22.
//

import UIKit

class LoginView: UIView {

    lazy var stackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userNameTextField, dividerView, passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.layer.cornerRadius = 4
        stackView.clipsToBounds = true
        stackView.backgroundColor = .backgroundColorWhite
        return stackView
    }()
    
    lazy var userNameTextField : UITextField = {
        let userName = UITextField()
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.backgroundColor = .backgroundColorWhite
        userName.placeholder = "Username"
        userName.delegate = self
        userName.font = UIFont(name: "Roboto", size: 12)
        userName.textColor = .backgroundColorGrayLight
        return userName
    }()
    
    lazy var dividerView : UIView = {
        let dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .backgroundColorGradyMed
        return dividerView
    }()
    
    lazy var passwordTextField : UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = .backgroundColorWhite
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.delegate = self
        password.font = UIFont(name: "Roboto", size: 12)
        password.textColor = .backgroundColorGrayLight
        return password
    }()
    
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
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

extension LoginView: UITextFieldDelegate{
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

