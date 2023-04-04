//
//  CircleTableViewCell.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 03/04/23.
//

import UIKit
import SnapKit
import Lottie

class CircleTableViewCell: UITableViewCell {
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var viewMask : UIView = {
        let viewAnimationMask = UIView()
        viewAnimationMask.translatesAutoresizingMaskIntoConstraints = false
        viewAnimationMask.backgroundColor = .clear
        viewAnimationMask.layer.cornerRadius = 25
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
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        setupViews()
        selectionStyle = .none
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CircleTableViewCell: CodableView {

    func configViews() {}

    func buildViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(viewMask)
        containerView.addSubview(loginAnimation)
    }

    func configConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        viewMask.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).inset(20)
            make.bottom.equalTo(containerView.snp.bottom).inset(20)
            make.centerX.equalTo(containerView.snp.centerX)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        loginAnimation.snp.makeConstraints { make in
            make.edges.equalTo(viewMask.snp.edges)
        }
    }
}

