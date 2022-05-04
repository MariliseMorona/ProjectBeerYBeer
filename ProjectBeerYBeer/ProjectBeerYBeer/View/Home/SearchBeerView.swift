//
//  SearchBeerView.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 04/05/22.
//

import UIKit

class SearchBeerView: UIView, UITextFieldDelegate {

    
    lazy var stackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelSearchBeer, viewSearchBeer])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()
    lazy var labelSearchBeer : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Selecione a cervejaria .."
        label.font = UIFont(name: "Roboto", size: 18)
        label.textAlignment = .left
        return label
    }()
    lazy var viewSearchBeer : UISearchTextField = {
        let search = UISearchTextField()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.text = "Cervejaria (marca)"
        search.textAlignment = .left
        search.delegate = self
        search.backgroundColor = .backgroundColorWhite
        return search
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUp(){
        addSubview(stackView)
        constraintLayout()
    }
    
    private func constraintLayout(){
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    

}
