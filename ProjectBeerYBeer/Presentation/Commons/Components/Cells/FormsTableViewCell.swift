//
//  FormsTableViewCell.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 03/04/23.
//

import UIKit
import SnapKit

struct DataForms {
    var title: String?
    var fPlaceholder: String?
    var isSecured: Bool
}

protocol FormsDelegateProtocol: AnyObject {
    func textFieldShouldClear(_ textField: UITextField) -> Bool
    func textFieldDidBeginEditing(_ textField: UITextField)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    func textFieldDidEndEditing(_ textField: UITextField)
}

class FormsTableViewCell: UITableViewCell {

    weak var delegate: FormsDelegateProtocol!
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var textField: UITextField = {
        let txtField = UITextField()
        txtField.delegate = self
        return txtField
    }()
    
    init() {
        super.init(style: .default, reuseIdentifier: nil)
        setupViews()
        selectionStyle = .none
    }
    
    func bind(_ model: DataForms?){
        guard let model = model else { return }
        self.textField.text = model.title
        self.textField.placeholder = model.fPlaceholder
        model.isSecured == true ? (self.textField.isSecureTextEntry = true) : (self.textField.isSecureTextEntry = false)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FormsTableViewCell: CodableView {

    func configViews() {}

    func buildViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(textField)
    }

    func configConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        textField.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).inset(3)
            make.leading.equalTo(containerView.snp.leading).inset(3)
            make.bottom.equalTo(containerView.snp.bottom).inset(3)
            make.trailing.equalTo(containerView.snp.trailing).inset(3)
        }
    }
}

extension FormsTableViewCell: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        guard let delegate = delegate else { return true }
        return delegate.textFieldShouldClear(textField)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let delegate = delegate else { return }
        delegate.textFieldDidBeginEditing(textField)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let delegate = delegate else { return true }
        return delegate.textFieldShouldReturn(textField)
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let delegate = delegate else { return true }
        return delegate.textFieldShouldEndEditing(textField)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let delegate = delegate else { return }
        delegate.textFieldDidEndEditing(textField)
    }
}
