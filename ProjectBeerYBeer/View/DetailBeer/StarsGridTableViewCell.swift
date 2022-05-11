//
//  StarsGridTableViewCell.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit

class StarsGridTableViewCell: UITableViewCell {

    lazy var stackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, starsButton])
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
    lazy var starsButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        return button
    }()
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
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
        ])
    }
}
