//
//  DetailBeerViewController.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit
import Kingfisher

class DetailBeerViewController: UIViewController {
    var beerSelected : Beer?
    let scrollView = UIScrollView()
    let contentView = UIView()
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
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    lazy var favoriteButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .backgroundColorWhite
        button.setTitle("Já provou essa?", for: .normal)
        button.setTitleColor(.backgroundColorBlack, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    private func setUp() {
        view.backgroundColor = .backgroundColorYellow
        view.addSubview(infoProfileView)
        configurateImageBeer()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        constraintsScrollView()
        contentView.addSubview(detailsBeerTableView)
        contentView.addSubview(favoriteButton)
        constraints()
    }
    private func constraintsScrollView() {
        infoProfileView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoProfileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoProfileView.heightAnchor.constraint(equalToConstant: 150),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: infoProfileView.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    private func constraints() {
        NSLayoutConstraint.activate([
            detailsBeerTableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailsBeerTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            detailsBeerTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            detailsBeerTableView.heightAnchor.constraint(equalToConstant: 950),
            
            favoriteButton.topAnchor.constraint(equalTo: detailsBeerTableView.bottomAnchor, constant: 10),
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            favoriteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            favoriteButton.heightAnchor.constraint(equalToConstant: 45),
            favoriteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func configurateImageBeer(){
            let imageBeerDetails = beerSelected?.image_url
            if imageBeerDetails != nil {
                guard let imagePath = beerSelected?.image_url else { return }
                let url = "\(imagePath)"
                if let beerImage = URL(string: url){
                    infoProfileView.imageBeer.kf.setImage(with: beerImage)
                }
            } else {
                infoProfileView.imageBeer.image = UIImage(named: "default")
            }
    }
    
    func favoritedBeer(){
       let idBeerFavorited = beerSelected?.id
        print(idBeerFavorited)
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
            cellDetailsBeer.detailTextLabel?.text = beerSelected?.description
            cellDetailsBeer.detailTextLabel?.numberOfLines = 0
        case 1:
            cellDetailsBeer.textLabel?.text = "ABV"
            cellDetailsBeer.detailTextLabel?.text = String(beerSelected?.abv ?? 0.0)
        case 2:
            cellDetailsBeer.textLabel?.text = "IBU"
            cellDetailsBeer.detailTextLabel?.text = String(beerSelected?.ibu ?? 0)
        case 3:
            cellDetailsBeer.textLabel?.text = "EBC"
            cellDetailsBeer.detailTextLabel?.text = String(beerSelected?.ebc ?? 0)
        case 4:
            cellDetailsBeer.textLabel?.text = "SRM"
            cellDetailsBeer.detailTextLabel?.text = String(beerSelected?.srm ?? 0.0)
        case 5:
            cellDetailsBeer.textLabel?.text = "pH"
            cellDetailsBeer.detailTextLabel?.text = String(beerSelected?.ph ?? 0.0)
        case 6:
            cellDetailsBeer.textLabel?.text = "Attenuation"
            cellDetailsBeer.detailTextLabel?.text = String(beerSelected?.attenuation_level ?? 0.0)
        case 7:
            cellDetailsBeer.textLabel?.text = "Métodos de fabricação"
        case 8:
            cellDetailsBeer.textLabel?.text = "Mash"
//            cellDetailsBeer.detailTextLabel?.text = String(beerSelected?.method.mash_temp)
        case 9:
            cellDetailsBeer.textLabel?.text = "Fermentação"
//            cellDetailsBeer.detailTextLabel?.text = String(beerSelected?.method.fermentation)
        case 10:
            cellDetailsBeer.textLabel?.text = "Twist"
            cellDetailsBeer.detailTextLabel?.text = beerSelected?.method.twist
        case 11:
            cellDetailsBeer.textLabel?.text = "Ingredientes"
//            cellDetailsBeer.detailTextLabel?.text = String(beerSelected?.ingredients)
            cellDetailsBeer.detailTextLabel?.numberOfLines = 0
        case 12:
            cellDetailsBeer.textLabel?.text = "Combina com"
//            cellDetailsBeer.detailTextLabel?.text = String(beerSelected?.food_pairing)
            cellDetailsBeer.detailTextLabel?.numberOfLines = 0
        case 13:
            cellDetailsBeer = cellStars
        default:
            return UITableViewCell()
        }
        return cellDetailsBeer
    }
}
