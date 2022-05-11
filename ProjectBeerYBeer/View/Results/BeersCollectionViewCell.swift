//
//  BeersCollectionViewCell.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit

class BeersCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "list-cell-reuse-identifier"
    
    lazy var labelCollectionViewCell : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.layer.borderColor = UIColor.backgroundColorBlack.cgColor
        label.layer.borderWidth = 2
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    private func setUp(){
        contentView.addSubview(labelCollectionViewCell)
        constraints()
    }
    
    private func constraints(){
        NSLayoutConstraint.activate([
            labelCollectionViewCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            labelCollectionViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            labelCollectionViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            labelCollectionViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
}
