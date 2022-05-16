//
//  BeerAPI.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 14/05/22.
//

import Foundation
import UIKit

let baseURL = "https://api.punkapi.com/v2"

class BeerAPI {
   
    var random: String = ""
//    var pagination = false
//    var offset : Int = 0
    
    func url(_ random: String) -> String {

        var url : String
        if random.isEmpty {
            url = "\(baseURL)/beers/random"
        } else {
            url = "\(baseURL)/beers/random"
            print("ver como passar mais parametros de busca e filtro")
        }
        return url
    }
    
    func getApi(url: String, completion: @escaping (Result<[Beer], Error>) -> Void){
        if let url = URL(string: url) {
            print(url)
//            self.pagination = true
            URLSession.shared.dataTask(with: url) {
                data, response, error in
                print(data!)
//                self.pagination = false
                if let data = data {
                    print(String(data: data, encoding: .utf8)!)
                    do {
                        let response = try JSONDecoder().decode([Beer].self, from: data)
//                        self.offset += 20
                        print(response)
                        completion(.success(response))
                    } catch let error {
                        completion(.failure(ApiError.apiInvalid))
                    }
                }
            }.resume()
        }else {
            completion(.failure(ApiError.urlInvalid))
            print("Connection fail")
        }
    }
}
