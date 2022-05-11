//
//  DetailBeerViewController.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit

class DetailBeerViewController: UIViewController {

    let cellStars = StarsGridTableViewCell()
    
    let infoProfileView = HeaderBeerView()
    
    lazy var detailsBeerTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .backgroundColorWhite
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell-details-beer")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    private func setUp() {
        view.backgroundColor = .backgroundColorYellow
        view.addSubview(infoProfileView)
        view.addSubview(detailsBeerTableView)
        constraints()
    }
    private func constraints() {
        infoProfileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoProfileView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            infoProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoProfileView.heightAnchor.constraint(equalToConstant: 200),
            detailsBeerTableView.topAnchor.constraint(equalTo: infoProfileView.bottomAnchor),
            detailsBeerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            detailsBeerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            detailsBeerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}
extension DetailBeerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellDetailsBeer = UITableViewCell(style: .subtitle, reuseIdentifier: "cell-details-beer")
        cellDetailsBeer.backgroundColor = .clear
        switch indexPath.row {
        case 0:
            cellDetailsBeer.textLabel?.text = "Descrição"
            cellDetailsBeer.detailTextLabel?.text = "Our flagship beer that kick started the craft beer revolution. This is James and Mastin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish."
            cellDetailsBeer.detailTextLabel?.numberOfLines = 0
        case 1:
            cellDetailsBeer.textLabel?.text = "ABV"
            cellDetailsBeer.detailTextLabel?.text = "6.0"
        case 2:
            cellDetailsBeer.textLabel?.text = "IBU"
            cellDetailsBeer.detailTextLabel?.text = "60.0"
        case 3:
            cellDetailsBeer.textLabel?.text = "EBC"
            cellDetailsBeer.detailTextLabel?.text = "17.0"
        case 4:
            cellDetailsBeer.textLabel?.text = "SRM"
            cellDetailsBeer.detailTextLabel?.text = "8.5"
        case 5:
            cellDetailsBeer.textLabel?.text = "pH"
            cellDetailsBeer.detailTextLabel?.text = "4.4"
        case 6:
            cellDetailsBeer.textLabel?.text = "Attenuation"
            cellDetailsBeer.detailTextLabel?.text = "82.12"
        case 7:
            cellDetailsBeer.textLabel?.text = "Métodos de fabricação"
        case 8:
            cellDetailsBeer.textLabel?.text = "Mash"
            cellDetailsBeer.detailTextLabel?.text = "65.0 graus Celsius por 75"
        case 9:
            cellDetailsBeer.textLabel?.text = "Fermentação"
            cellDetailsBeer.detailTextLabel?.text = "19.0 graus Celsius"
        case 10:
            cellDetailsBeer.textLabel?.text = "Twist"
            cellDetailsBeer.detailTextLabel?.text = "nul"
        case 11:
            cellDetailsBeer.textLabel?.text = "Ingredientes"
            cellDetailsBeer.detailTextLabel?.text = "Malte Extra Pale 5.3 kilogramas hops Ahtanum 17.5 gramas adicionano no start confere amargor, Chinook 15.0 gramas adicionado ao start confere amargor, levedura Wyeats 1056 American Ale."
            cellDetailsBeer.detailTextLabel?.numberOfLines = 0
        case 12:
            cellDetailsBeer.textLabel?.text = "Combina com"
            cellDetailsBeer.detailTextLabel?.text = "Spicy carne asada with a pico de gallo sauce, Shredded chicken tacos with a mango chilli lime salsa, Cheesecake with a passion fruit swirl sauce."
            cellDetailsBeer.detailTextLabel?.numberOfLines = 0
        case 13:
            cellDetailsBeer = cellStars
        default:
            return UITableViewCell()
        }
        return cellDetailsBeer
    }
}
