//
//  RoundedImage.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 02/05/22.
//

import Foundation
import UIKit

extension UIImageView{
    
    func roundedImage(){
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
