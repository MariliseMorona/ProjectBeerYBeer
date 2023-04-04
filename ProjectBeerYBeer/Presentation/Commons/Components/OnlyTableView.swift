//
//  OnlyTableView.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 03/04/23.
//

import Foundation
import UIKit
import SnapKit

class OnlyTableView: UIView {

    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureTableProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
}

extension OnlyTableView: CodableView {

    func configViews() {}

    func buildViews() {
        addSubview(tableView)
    }

    func configConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

