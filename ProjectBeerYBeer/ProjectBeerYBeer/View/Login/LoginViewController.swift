//
//  ViewController.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 02/05/22.
//

import UIKit
import Lottie

class LoginViewController: UIViewController{
    
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
    lazy var signInButton : UIButton = {
        let signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: [])
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.addTarget(self, action: #selector(signInTapped(sender:)), for: .primaryActionTriggered)
        signInButton.tintColor = .backgroundColorBlack
        return signInButton
    }()
    let newUserMessageLabel : UILabel = {
        let newUser = UILabel()
        newUser.translatesAutoresizingMaskIntoConstraints = false
        newUser.textAlignment = .center
        newUser.text = "New user ?"
        newUser.textColor = .backgroundColorBlack
        newUser.numberOfLines = 0
        newUser.isHidden = false
        newUser.font = UIFont(name: "Roboto", size: 14)
        return newUser
    }()
    var userName: String?{
        return loginView.userNameTextField.text
    }
    var password: String?{
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorYellow
//        viewMask.roundedImage()
        setUp()
    }
    
    private func setUp(){
        view.addSubview(viewMask)
        viewMask.addSubview(loginAnimation)
        view.addSubview(loginView)
        view.addSubview(errorMessageLabel)
        view.addSubview(signInButton)
        view.addSubview(newUserMessageLabel)
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

            loginView.topAnchor.constraint(equalTo: viewMask.bottomAnchor, constant: 10),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            errorMessageLabel.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 10),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            signInButton.topAnchor.constraint(equalTo: errorMessageLabel.bottomAnchor, constant: 10),
            signInButton.leadingAnchor.constraint(equalTo: errorMessageLabel.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: errorMessageLabel.trailingAnchor),
            
            newUserMessageLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            newUserMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            newUserMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor),
        ])
    }
    
    @objc func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
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
            self.present(HomeViewController(), animated: true, completion: nil)
        } else {
            configureView(withMessage: "Incorrect username/ password.")
        }
    }
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
