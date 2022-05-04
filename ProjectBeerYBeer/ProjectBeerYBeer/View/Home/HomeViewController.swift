//
//  HomeViewController.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 02/05/22.
//

import UIKit

class HomeViewController: UIViewController {

    let welcomeView = WelcomeView()
    let searchBeer = SearchBeerView()
    lazy var buttonGo : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .backgroundColorBlack
        button.setTitle("Go", for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
//    let selectTheLocalView = WelcomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColorYellowPlusLight
        setUp()
    }
    
    private func setUp(){
        view.addSubview(welcomeView)
        view.addSubview(searchBeer)
        view.addSubview(buttonGo)
        constraintLayout()
        
    }
    
    private func constraintLayout(){
        welcomeView.translatesAutoresizingMaskIntoConstraints = false
        searchBeer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            welcomeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            welcomeView.heightAnchor.constraint(equalToConstant: 50),
            welcomeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            welcomeView.widthAnchor.constraint(equalToConstant: (view.frame.size.width/2)+100),
            welcomeView.bottomAnchor.constraint(equalTo: searchBeer.topAnchor),
            searchBeer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            searchBeer.widthAnchor.constraint(equalToConstant: (view.frame.size.width/2)+100),
            searchBeer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonGo.topAnchor.constraint(equalTo: searchBeer.bottomAnchor),
            buttonGo.trailingAnchor.constraint(equalTo: searchBeer.trailingAnchor, constant: 20),
            buttonGo.leadingAnchor.constraint(equalTo: welcomeView.leadingAnchor, constant: -20),
            buttonGo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
            
            ])
    }
}
