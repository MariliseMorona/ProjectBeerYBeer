//
//  HomeView.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 02/05/22.
//

import UIKit

class WelcomeView: UIView {

    lazy var labelWelcomeText : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.text = "Olá cachaceiro"
        label.font = UIFont(name: "RobotoBold", size: 18)
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUp(){
        addSubview(labelWelcomeText)
        constraintLayout()
    }
    
    private func constraintLayout(){
        NSLayoutConstraint.activate([
            labelWelcomeText.topAnchor.constraint(equalTo: topAnchor),
            labelWelcomeText.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelWelcomeText.bottomAnchor.constraint(equalTo: bottomAnchor),
            labelWelcomeText.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    

}
