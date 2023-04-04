//
//  Components.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 14/05/22.
//

import UIKit

extension UILabel{
    static func label(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.numberOfLines = 0
        label.font = UIFont(name: "Roboto", size: 12)
        label.textColor = .backgroundColorBlack
        return label
    }
    static func label() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .backgroundColorBrown
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }
}
extension UITextField{
    static func textField(placeholder: String, backgroundColor: UIColor, textColor : UIColor) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = backgroundColor
        textField.placeholder = placeholder
        textField.font = UIFont(name: "Roboto", size: 12)
        textField.textColor = .backgroundColorGrayLight
        textField.layer.cornerRadius = 4
        return textField
    }
}
extension UIButton{
    static func button(setTitle: String, backgroundColor: UIColor) -> UIButton {
        let signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle(setTitle, for: [])
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.tintColor = backgroundColor
        signInButton.layer.cornerRadius = 4
        return signInButton
    }
}
