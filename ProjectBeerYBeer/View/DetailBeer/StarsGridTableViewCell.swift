//
//  StarsGridTableViewCell.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit

class StarsGridTableViewCell: UITableViewCell {

    lazy var stackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, fiveStarControl])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nota dos amigos:"
        return label
    }()
    let fiveStarControl = StarRatingStackView(frame: CGRect(x: (Int(UIScreen.main.bounds.width) - Int((5*Int(kStarSize))+(4*kSpacing)))/2, y: 100, width: Int((5*Int(kStarSize)) + (4*kSpacing)), height: Int(kStarSize)))
    override func layoutSubviews() {
        super.layoutSubviews()
        setUp()
    }
    func setUp() {
        backgroundColor = .clear
        addSubview(stackView)
        constrains()
    }
    func constrains() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
        ])
    }
}
