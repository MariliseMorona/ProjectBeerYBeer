//
//  LoginViewController.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit
import Lottie

class LoginViewController: UIViewController {

    lazy var viewMask : UIView = {
        let viewAnimationMask = UIView()
        viewAnimationMask.translatesAutoresizingMaskIntoConstraints = false
        viewAnimationMask.backgroundColor = .clear
        viewAnimationMask.layer.cornerRadius = 90
        viewAnimationMask.clipsToBounds = true
        viewAnimationMask.layer.borderWidth = 1
        viewAnimationMask.layer.borderColor = UIColor.backgroundColorBlack.cgColor
        return viewAnimationMask
    }()

    lazy var loginAnimation : AnimationView = {
        var animation = AnimationView()
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation = .init(name: "loginBeer")
        animation.frame = view.bounds
        animation.loopMode = .loop
        animation.clipsToBounds = true
        return animation
    }()
    
    let loginView = LoginView()
    
    let errorMessageLabel : UILabel = {
        let errorMessage = UILabel()
        errorMessage.translatesAutoresizingMaskIntoConstraints = false
        errorMessage.textAlignment = .center
        errorMessage.textColor = .backgroundColorBrown
        errorMessage.numberOfLines = 0
        errorMessage.isHidden = true
        return errorMessage
    }()
    let signInButton = UIButton.button(setTitle: "Sign In", backgroundColor: .backgroundColorBlack)
    let newUserButton = UIButton.button(setTitle: "New user?", backgroundColor: .clear)

    var userName: String?{
        return loginView.userNameTextField.text
    }
    var password: String?{
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorYellow
        setUp()
    }
    
    private func setUp(){
        view.addSubview(viewMask)
        viewMask.addSubview(loginAnimation)
        view.addSubview(loginView)
        view.addSubview(errorMessageLabel)
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(signInTapped(sender:)), for: .primaryActionTriggered)
        newUserButton.addTarget(self, action: #selector(registerInTapped(sender:)), for: .primaryActionTriggered)
        view.addSubview(newUserButton)
        constraintLayout()
        loginAnimation.play()
        
    }
    
    private func constraintLayout(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewMask.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            viewMask.heightAnchor.constraint(equalToConstant: 180),
            viewMask.widthAnchor.constraint(equalToConstant: 180),
            viewMask.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginAnimation.topAnchor.constraint(equalTo: viewMask.topAnchor),
            loginAnimation.trailingAnchor.constraint(equalTo: viewMask.trailingAnchor),
            loginAnimation.bottomAnchor.constraint(equalTo: viewMask.bottomAnchor),
            loginAnimation.leadingAnchor.constraint(equalTo: viewMask.leadingAnchor),

            loginView.topAnchor.constraint(equalTo: viewMask.bottomAnchor, constant: 300),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            errorMessageLabel.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 10),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            signInButton.topAnchor.constraint(equalTo: errorMessageLabel.bottomAnchor, constant: 10),
            signInButton.leadingAnchor.constraint(equalTo: errorMessageLabel.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: errorMessageLabel.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 40),
            
            newUserButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            newUserButton.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            newUserButton.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor),
        ])
    }
    
    @objc func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
    }
    @objc func registerInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
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
        if userName == "Kevin" && password == "oi"{
            signInButton.configuration?.showsActivityIndicator = true
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
