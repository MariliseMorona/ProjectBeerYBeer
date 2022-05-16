//
//  RegisterViewController.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 14/05/22.
//

import UIKit

class RegisterUserViewController: UIViewController {
    let welcomeLabel =  UILabel.label(text: "Seja bem-vindo ao")
    let registerView = RegisterUserView()
    let registerButton = UIButton.button(setTitle: "Cadastrar", backgroundColor: .backgroundColorBlack)
    let errorMessageLabel : UILabel = {
        let errorMessage = UILabel()
        errorMessage.translatesAutoresizingMaskIntoConstraints = false
        errorMessage.textAlignment = .center
        errorMessage.textColor = .backgroundColorBrown
        errorMessage.numberOfLines = 0
        errorMessage.isHidden = true
        return errorMessage
    }()
    var userName: String?{
        return registerView.nameTextField.text
    }
    var email: String?{
        return registerView.emailTextField.text
    }
    var password: String?{
        return registerView.passwordTextField.text
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorYellow
        setUp()
    }
    
    private func setUp(){
        view.addSubview(registerView)
        view.addSubview(registerButton)
        view.addSubview(errorMessageLabel)
        registerButton.addTarget(self, action: #selector(confirmRegisterInTapped(sender:)), for: .primaryActionTriggered)
        constraintLayout()
    }
    
    private func constraintLayout(){
        registerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            registerView.topAnchor.constraint(equalTo: view.topAnchor),
            registerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.topAnchor.constraint(equalTo: registerView.bottomAnchor, constant: 10),
            registerButton.leadingAnchor.constraint(equalTo: registerView.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: registerView.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            errorMessageLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
            errorMessageLabel.leadingAnchor.constraint(equalTo: registerView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: registerView.trailingAnchor),
            errorMessageLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    @objc func confirmRegisterInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
        let openReults = ResultsViewController()
        self.navigationController?.pushViewController(openReults, animated: true)
    }
    
    private func login(){
        guard let userName = userName, let password = password else {
            assertionFailure("Username/ password should never be nil.")
            return
        }
        if userName.isEmpty || password.isEmpty{
            configureView(withMessage: "Username/ password cannot be blank.")
            return
        }
        if userName == "Kevin" && password == "oi"{
            registerButton.configuration?.showsActivityIndicator = true
            self.show(ResultsViewController(), sender: nil)
//            self.present(ResultsViewController(), animated: true, completion: nili
        } else {
            configureView(withMessage: "Incorrect username/ password.")
        }
    }
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}

