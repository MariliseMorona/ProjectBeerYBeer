//
//  InfoProfileView.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit

class InfoProfileView: UIView {

    lazy var labelRanking : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ranking"
        label.backgroundColor = .backgroundColorYellow
        label.textColor = .backgroundColorBlack
        label.textAlignment = .right
        return label
    }()
    lazy var imageProfile : UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderColor = UIColor.backgroundColorBlack.cgColor
        image.layer.borderWidth = 2
        image.layer.cornerRadius = 45
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUp() {
        addSubview(labelRanking)
        addSubview(imageProfile)
        constrains()
    }
    func constrains() {
        NSLayoutConstraint.activate([
            labelRanking.topAnchor.constraint(equalTo: topAnchor),
//            labelRanking.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelRanking.bottomAnchor.constraint(equalTo: bottomAnchor),
            labelRanking.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelRanking.widthAnchor.constraint(equalToConstant: 200),
            
            imageProfile.topAnchor.constraint(equalTo: labelRanking.topAnchor, constant: -20),
            imageProfile.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            imageProfile.bottomAnchor.constraint(equalTo: labelRanking.bottomAnchor, constant: 20),
            imageProfile.widthAnchor.constraint(equalToConstant: 90),
            imageProfile.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
