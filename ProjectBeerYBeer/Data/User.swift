//
//  User.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 16/05/22.
//

import UIKit

enum SerializationError: Error {
    case missing(String)
    case invalid(String)
}
struct Users: Codable{
    let user : [User]
}
struct User: Codable {
    let name, password, img_profile : String
}

extension User {
    init(JSON: [String: Any]) throws {
        guard let name = JSON["name"] as? String else {
            throw SerializationError.missing("name")
        }
        guard let password = JSON["password"] as? String else {
            throw SerializationError.missing("password")
        }
        guard let img_profile = JSON["img_profile"] as? String else {
            throw SerializationError.missing("img_profile")
        }

        self.name = name
        self.password = password
        self.img_profile = img_profile
    }
}
