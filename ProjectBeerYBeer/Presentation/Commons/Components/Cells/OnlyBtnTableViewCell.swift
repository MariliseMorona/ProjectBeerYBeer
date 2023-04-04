//
//  OnlyBtnTableViewCell.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 03/04/23.
//

import UIKit
import SnapKit

class OnlyBtnTableViewCell: UITableViewCell {
    
    var onClick: (() -> Void)?
    private var btnTitle: String = ""
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var uiBtn = UIButton.button(setTitle: "", backgroundColor: .backgroundColorWhite)
    
    init(_ title: String) {
        super.init(style: .default, reuseIdentifier: nil)
        self.btnTitle = title
        uiBtn.setTitle(title, for: .normal)
        uiBtn.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        setupViews()
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func goToNext() {
        guard let click = self.onClick else { return }
        click()
    }
}

extension OnlyBtnTableViewCell: CodableView {

    func configViews() {}

    func buildViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(uiBtn)
    }

    func configConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        uiBtn.snp.makeConstraints { make in
            make.center.equalTo(containerView.snp.center)
            make.width.equalTo(UIScreen.main.bounds.width/2.5)
            make.height.equalTo(50)
        }
    }
}
