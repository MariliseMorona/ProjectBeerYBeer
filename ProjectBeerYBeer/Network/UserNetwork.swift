//
//  UserNetwork.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 16/05/22.
//

import UIKit

class UserNetwork {
    var result: Users?
    
    func parseJSON(){
        guard let path = Bundle.main.path(forResource: "users", ofType: "json") else {
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
        let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Users.self, from: jsonData)

            if let result = result {
                print(result)
            }else{
                print(SerializationError.invalid(""))
            }
        }catch {
            print("Error: \(error)")
        }

    }
}
