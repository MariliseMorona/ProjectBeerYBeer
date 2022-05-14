//
//  DetailProfileViewController.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 10/05/22.
//

import UIKit

class DetailProfileViewController: UIViewController {

    let infoProfileView = InfoProfileView()
    
    static let sectionBackgroundDecorationElementK = "section-background-element-k"
    var currentSnapshotRankingBeer: NSDiffableDataSourceSnapshot<Int, Int>! = nil
    var dataSourceRankingBeer: UICollectionViewDiffableDataSource<Int, Int>! = nil
    
    lazy var rankingBeerCollectionView : UICollectionView = {
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: createRankingCollectionLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.register(RankingBeerCollectionViewCell.self, forCellWithReuseIdentifier: RankingBeerCollectionViewCell.reuseIdentifier)
        collection.delegate = self
        return collection
    }()
    
    lazy var labelTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Outras Recomendações"
        label.backgroundColor = .backgroundColorYellow
        label.textColor = .backgroundColorBlack
        label.textAlignment = .center
        return label
    }()
    
    lazy var recomendationBeerCollectionView : UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .blue
        collection.register(RecomendationCollectionViewCell.self, forCellWithReuseIdentifier: RecomendationCollectionViewCell.reuseIdentifier)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUp() {
        view.backgroundColor = .backgroundColorWhite
        view.addSubview(infoProfileView)
        view.addSubview(rankingBeerCollectionView)
        view.addSubview(labelTitle)
        view.addSubview(recomendationBeerCollectionView)
        constraints()
        setUpCollectionView()
    }
    private func constraints() {
        infoProfileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoProfileView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            infoProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoProfileView.heightAnchor.constraint(equalToConstant: 50),
            
            rankingBeerCollectionView.topAnchor.constraint(equalTo: infoProfileView.bottomAnchor, constant: 40),
            rankingBeerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rankingBeerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rankingBeerCollectionView.heightAnchor.constraint(equalToConstant: 180),
            
            labelTitle.topAnchor.constraint(equalTo: rankingBeerCollectionView.bottomAnchor, constant: 30),
            labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            labelTitle.heightAnchor.constraint(equalToConstant: 50),
            
            recomendationBeerCollectionView.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 30),
            recomendationBeerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recomendationBeerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recomendationBeerCollectionView.heightAnchor.constraint(equalToConstant: 350),
            
        ])
    }
    private func setUpCollectionView(){
        configureRankingDataSource()
    }
}

//MARK: Controller Layouts Collections
extension DetailProfileViewController {
    func createRankingCollectionLayout() -> UICollectionViewLayout {
        let fraction: CGFloat = 1.0 / 3.0
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(1.2))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 0, trailing: 2.5)
        section.orthogonalScrollingBehavior = .continuous
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.7
                let maxScale: CGFloat = 1.1
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
        let layout = UICollectionViewCompositionalLayout(section: section)
        layout.register(RankingBeerCollectionViewCell.self, forDecorationViewOfKind: DetailProfileViewController.sectionBackgroundDecorationElementK)
        return layout
    }
}
extension DetailProfileViewController {
    func configureRankingDataSource() {
        dataSourceRankingBeer = UICollectionViewDiffableDataSource
        <Int, Int>(collectionView: rankingBeerCollectionView) { [weak self]
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            guard let self = self, let currentSnapshot = self.currentSnapshotRankingBeer else { return nil }
            let sectionIdentifier = currentSnapshot.sectionIdentifiers[indexPath.section]
            let numberOfItemsInSection = currentSnapshot.numberOfItems(inSection: sectionIdentifier)
            let isLastCell = indexPath.item + 1 == numberOfItemsInSection
            if let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RankingBeerCollectionViewCell.reuseIdentifier,
                for: indexPath) as? RankingBeerCollectionViewCell {
                
                return cell
            } else {
                fatalError("Cannot create new cell")
            }
        }
        let itemsPerSection = 5
        let sections = Array(0..<1)
        currentSnapshotRankingBeer = NSDiffableDataSourceSnapshot<Int, Int>()
        var itemOffset = 0
        sections.forEach {
            currentSnapshotRankingBeer.appendSections([$0])
            currentSnapshotRankingBeer.appendItems(Array(itemOffset..<itemOffset + itemsPerSection))
            itemOffset += itemsPerSection
        }
        dataSourceRankingBeer.apply(currentSnapshotRankingBeer, animatingDifferences: false)
    }
}

//MARK: CollectionsView Delegate
extension DetailProfileViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexCell  = indexPath.row
        print("celula selecionada \(indexCell)")
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.size.width/5+10, height: view.frame.size.width/5+10)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
extension DetailProfileViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecomendationCollectionViewCell.reuseIdentifier,
            for: indexPath) as? RecomendationCollectionViewCell{
            return cell
        } else {
            fatalError("Cannot create new cell")
        }
    }
}

