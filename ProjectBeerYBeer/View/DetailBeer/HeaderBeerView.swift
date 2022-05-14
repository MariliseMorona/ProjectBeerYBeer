//
//  HeaderBeer.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit

class HeaderBeerView: UIView {

    lazy var labelBeer : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name Beer"
        label.backgroundColor = .backgroundColorWhite
        label.textColor = .backgroundColorBlack
        label.textAlignment = .right
        return label
    }()
    lazy var imageBeer : UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderColor = UIColor.backgroundColorBlack.cgColor
        image.layer.borderWidth = 2
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
        addSubview(labelBeer)
        addSubview(imageBeer)
        constrains()
    }
    func constrains() {
        NSLayoutConstraint.activate([
            labelBeer.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelBeer.heightAnchor.constraint(equalToConstant: 30),
            labelBeer.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelBeer.widthAnchor.constraint(equalToConstant: 200),
            
            imageBeer.centerYAnchor.constraint(equalTo: labelBeer.centerYAnchor),
            imageBeer.topAnchor.constraint(equalTo: topAnchor),
            imageBeer.leadingAnchor.constraint(equalTo: labelBeer.trailingAnchor, constant: 20),
            imageBeer.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageBeer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
