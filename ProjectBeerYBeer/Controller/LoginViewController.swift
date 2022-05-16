//
//  LoginViewController.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit
import Lottie

class LoginViewController: UIViewController {
    
    var userArray: [User] = []
    var result: Users?
    let userNetwork = UserNetwork()
    
    let loginView = LoginView()

    var userName: String?{
        return loginView.accessView.userNameTextField.text
    }
    var password: String?{
        return loginView.accessView.passwordTextField.text
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorYellow
        setUp()
        loginView.animationView.loginAnimation.play()
    }
    
    private func setUp(){
        userNetwork.parseJSON()
        view.addSubview(loginView)
        actionButtons()
        constraintLayout()
    }
    
    private func constraintLayout(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    private func actionButtons(){
        loginView.signInButton.addTarget(self, action: #selector(signInTapped(sender:)), for: .primaryActionTriggered)
        loginView.newUserButton.addTarget(self, action: #selector(registerInTapped(sender:)), for: .primaryActionTriggered)
    }
    
    @objc func signInTapped(sender: UIButton){
        loginView.errorMessageLabel.isHidden = true
        login()
    }
    @objc func registerInTapped(sender: UIButton){
        loginView.errorMessageLabel.isHidden = true
        let openRegister = RegisterUserViewController()
        self.navigationController?.pushViewController(openRegister, animated: true)
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

//        guard let nameJson = result?.user.name else { return }
//        guard let passwordJson = result?.user.password else { return }
         
//        if userName == nameJson && password == passwordJson {
        if userName == "Kevin" && password == "oi"{
            loginView.signInButton.configuration?.showsActivityIndicator = true
            self.show(ResultsViewController(), sender: nil)
        } else {
            configureView(withMessage: "Incorrect username/ password.")
        }
    }
    private func configureView(withMessage message: String){
        loginView.errorMessageLabel.isHidden = false
        loginView.errorMessageLabel.text = message
    }
}
