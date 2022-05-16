//
//  AnimationView.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 16/05/22.
//

import UIKit
import Lottie

class LoginAnimationView: UIView {
    
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
//        animation.frame = viewMask.bounds
        animation.loopMode = .loop
        animation.clipsToBounds = true
        animation.isHidden = false
        return animation
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUp() {
        addSubview(viewMask)
        addSubview(loginAnimation)
        constrains()
    }
    func constrains() {
        NSLayoutConstraint.activate([
            viewMask.topAnchor.constraint(equalTo: topAnchor),
            viewMask.bottomAnchor.constraint(equalTo: bottomAnchor),
            viewMask.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewMask.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            loginAnimation.topAnchor.constraint(equalTo: viewMask.topAnchor),
            loginAnimation.trailingAnchor.constraint(equalTo: viewMask.trailingAnchor),
            loginAnimation.bottomAnchor.constraint(equalTo: viewMask.bottomAnchor),
            loginAnimation.leadingAnchor.constraint(equalTo: viewMask.leadingAnchor)
        ])
    }
}

