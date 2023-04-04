//
//  ResultsViewController.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit
import SwiftUI

class ResultsViewController: UIViewController {
    
    var loadAPI = BeerAPI()
    var beersAPI : [Beer] = []
    var beer : Beer?
    
    static let sectionBackgroundDecorationElementKind = "section-background-element-kind"
    static let sectionBackgroundDecorationElementKindow = "section-background-element-kindou"
    var currentSnapshotBeer: NSDiffableDataSourceSnapshot<Int, Int>! = nil
    var currentSnapshotProfile: NSDiffableDataSourceSnapshot<Int, Int>! = nil
    var dataSourceProfile: UICollectionViewDiffableDataSource<Int, Int>! = nil
    var dataSourceBeer: UICollectionViewDiffableDataSource<Int, Int>! = nil
    
    lazy var collectionViewProfiles : UICollectionView = {
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: createProfileCollectionLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.reuseIdentifier)
        collection.delegate = self
        return collection
    }()
    
    lazy var viewSearchBeer : UISearchTextField = {
        let search = UISearchTextField()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.text = "Cervejaria (marca)"
        search.textAlignment = .left
        search.delegate = self
        search.backgroundColor = .white
        return search
    }()
    
    lazy var collectionViewBeer : UICollectionView = {
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: createBeerCollectionLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.register(BeersCollectionViewCell.self, forCellWithReuseIdentifier: BeersCollectionViewCell.reuseIdentifier)
        collection.delegate = self
        return collection
    }()
    
    lazy var newBeerButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .backgroundColorYellow
        button.setTitle("Cerveja nova?", for: .normal)
        button.layer.cornerRadius = 5
        button.setTitleColor(.backgroundColorBlack, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpCollectionView()
        getDataAPI()
    }
    private func setUp() {
        view.backgroundColor = .backgroundColorWhite
        view.addSubview(collectionViewProfiles)
        view.addSubview(viewSearchBeer)
        view.addSubview(collectionViewBeer)
        view.addSubview(newBeerButton)
        constraints()
    }
    private func constraints() {
        NSLayoutConstraint.activate([
            collectionViewProfiles.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionViewProfiles.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewProfiles.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewProfiles.heightAnchor.constraint(equalToConstant: 100),
            
            viewSearchBeer.topAnchor.constraint(equalTo: collectionViewProfiles.bottomAnchor, constant: 20),
            viewSearchBeer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -5),
            viewSearchBeer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width/2.2),
            viewSearchBeer.heightAnchor.constraint(equalToConstant: 45),
            
            collectionViewBeer.topAnchor.constraint(equalTo: viewSearchBeer.bottomAnchor, constant: 20),
            collectionViewBeer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionViewBeer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionViewBeer.heightAnchor.constraint(equalToConstant: 480),
            
            newBeerButton.topAnchor.constraint(equalTo: collectionViewBeer.bottomAnchor, constant: 20),
            newBeerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            newBeerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            newBeerButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    private func setUpCollectionView(){
        configureBeerDataSource()
        configureProfileDataSource()
    }
    func getDataAPI(){
        loadAPI.getApi(url: loadAPI.url("")) { result in
            switch result {
            case .success(let beers):
                let response = beers
                self.beersAPI = response
                DispatchQueue.main.async {
                    self.reloadCollectionBeers()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    private func reloadCollectionBeers(){
        collectionViewBeer.reloadData()
    }
}
//MARK: TextField Delegate
extension ResultsViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewSearchBeer.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
//MARK: Controller Layouts Collections
extension ResultsViewController {
    func createBeerCollectionLayout() -> UICollectionViewLayout {
        let fraction: CGFloat = 1.0 / 3.2
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        layout.register(BeersCollectionViewCell.self, forDecorationViewOfKind: ResultsViewController.sectionBackgroundDecorationElementKind)
        return layout
    }
    
    func createProfileCollectionLayout() -> UICollectionViewLayout {
        let fraction: CGFloat = 1.0 / 4.0
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 0, trailing: 2.5)
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        layout.register(ProfileCollectionViewCell.self, forDecorationViewOfKind: ResultsViewController.sectionBackgroundDecorationElementKindow)
        return layout
    }
}
extension ResultsViewController {
    func configureBeerDataSource() {
        dataSourceBeer = UICollectionViewDiffableDataSource<Int, Int>(collectionView: collectionViewBeer) { [weak self]
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            guard let self = self, let currentSnapshot = self.currentSnapshotBeer else { return nil }
            let sectionIdentifier = currentSnapshot.sectionIdentifiers[indexPath.section]
            let numberOfItemsInSection = currentSnapshot.numberOfItems(inSection: sectionIdentifier)
            let isLastCell = indexPath.item + 1 == numberOfItemsInSection
            if let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BeersCollectionViewCell.reuseIdentifier, for: indexPath) as? BeersCollectionViewCell {
                //                ForEach(beersAPI){ beer in
                //                    cell.beerImage = beer
                //                }
                for beer in self.beersAPI{
                    cell.beerImage = beer
                }
                return cell
            } else {
                fatalError("Cannot create new cell")
            }
        }
        let itemsPerSection = 5
        let sections = Array(0..<3)
        currentSnapshotBeer = NSDiffableDataSourceSnapshot<Int, Int>()
        var itemOffset = 0
        sections.forEach {
            currentSnapshotBeer.appendSections([$0])
            currentSnapshotBeer.appendItems(Array(itemOffset..<itemOffset + itemsPerSection))
            itemOffset += itemsPerSection
            
        }
        dataSourceBeer.apply(currentSnapshotBeer, animatingDifferences: false)
    }
    
    func configureProfileDataSource() {
        dataSourceProfile = UICollectionViewDiffableDataSource
        <Int, Int>(collectionView: collectionViewProfiles) { [weak self]
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            guard let self = self, let currentSnapshot = self.currentSnapshotProfile else { return nil }
            let sectionIdentifier = currentSnapshot.sectionIdentifiers[indexPath.section]
            let numberOfItemsInSection = currentSnapshot.numberOfItems(inSection: sectionIdentifier)
            let isLastCell = indexPath.item + 1 == numberOfItemsInSection
            if let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfileCollectionViewCell.reuseIdentifier,
                for: indexPath) as? ProfileCollectionViewCell {
                
                return cell
            } else {
                fatalError("Cannot create new cell")
            }
        }
        let itemsPerSection = 5
        let sections = Array(0..<1)
        currentSnapshotProfile = NSDiffableDataSourceSnapshot<Int, Int>()
        var itemOffset = 0
        sections.forEach {
            currentSnapshotProfile.appendSections([$0])
            currentSnapshotProfile.appendItems(Array(itemOffset..<itemOffset + itemsPerSection))
            itemOffset += itemsPerSection
        }
        dataSourceProfile.apply(currentSnapshotProfile, animatingDifferences: false)
    }
}

//MARK: CollectionsView Delegate
extension ResultsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewProfiles {
            var openProfileVC = DetailProfileViewController()
            
            self.navigationController?.pushViewController(openProfileVC, animated: true)
        }else {
            
            //            var openBeerVC = DetailBeerViewController()
            //            if let beerID = dataSourceBeer.itemIdentifier(for: indexPath) {
            //                openBeerVC.beerSelected = beersAPI[beerID]
            //                self.navigationController?.pushViewController(openBeerVC, animated: true)
            //            }
            var openBeerVC = DetailBeerViewController()
            openBeerVC.beerSelected = beersAPI[indexPath.item]
            //            openBeerVC.beerSelected = beer[indexPath.section].items[indexPath.row]
            self.navigationController?.pushViewController(openBeerVC, animated: true)
        }
    }
}
extension Collection where Indices.Iterator.Element == Index {
    public subscript(safe index: Index) -> Iterator.Element? {
        return (startIndex <= index && index < endIndex) ? self[index] : nil
    }
}
