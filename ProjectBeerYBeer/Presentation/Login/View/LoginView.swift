//
//  LoginView.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 16/05/22.
//

import UIKit

class LoginView: UIView {
    
//    let animationView = LoginAnimationView()
    let accessView = AccessView()
    let errorMessageLabel = UILabel.label()
    let signInButton = UIButton.button(setTitle: "Sign In", backgroundColor: .backgroundColorBlack)
    let newUserButton = UIButton.button(setTitle: "New user?", backgroundColor: .clear)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUp() {
//        addSubview(animationView)
        addSubview(accessView)
        addSubview(errorMessageLabel)
        addSubview(signInButton)
        addSubview(newUserButton)
        constrains()
    }
    func constrains() {
//        animationView.translatesAutoresizingMaskIntoConstraints = false
        accessView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            animationView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
//            animationView.heightAnchor.constraint(equalToConstant: 180),
//            animationView.widthAnchor.constraint(equalToConstant: 180),
//            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            accessView.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 300),
//            accessView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            accessView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            errorMessageLabel.topAnchor.constraint(equalTo: accessView.bottomAnchor, constant: 10),
            errorMessageLabel.leadingAnchor.constraint(equalTo: accessView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: accessView.trailingAnchor),
            signInButton.topAnchor.constraint(equalTo: errorMessageLabel.bottomAnchor, constant: 10),
            signInButton.leadingAnchor.constraint(equalTo: errorMessageLabel.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: errorMessageLabel.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 40),
            newUserButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            newUserButton.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            newUserButton.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
    }
}
