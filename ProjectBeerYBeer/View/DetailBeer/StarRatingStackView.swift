//
//  RatingStarsView.swift
//  ProjectBeerYBeer
//
////  Created by Marilise Morona on 11/05/22.
////

import UIKit

let kSpacing: Int = 4
let kStarSize: CGFloat = 44.0

class StarRatingStackView: UIStackView {
    
    var detailBeerVC : DetailBeerViewController?
    
    private var ratingButtons = [UIButton]()
    var rating: Int = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    var starCount: Int = 5 {
        didSet {
            setUpButtons()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        spacing = CGFloat(kSpacing)
        setUpButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpButtons()
    }
    
    private func setUpButtons() {
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        for index in 0..<starCount {
        
            let button = UIButton()
            button.backgroundColor = .blue
            
            button.setImage(#imageLiteral(resourceName: "emptyStar"), for: .normal)
            button.setImage(#imageLiteral(resourceName: "filledStar"), for: .selected)
            button.setImage(#imageLiteral(resourceName: "highlightedStar"), for: .highlighted)
            button.setImage(#imageLiteral(resourceName: "highlightedStar"), for: [.highlighted, .selected])
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
    }
    
    @objc func ratingButtonTapped(button: UIButton) {
        
        guard let index = ratingButtons.index(of: button) else {
            fatalError("Button is not in the array of Buttons")
        }
        
        let selectedRating = index+1
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
            detailBeerVC?.favoritedBeer()
        }
    }
    
    func updateButtonSelectionStates() {
        
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
            
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
        }
    }

}
