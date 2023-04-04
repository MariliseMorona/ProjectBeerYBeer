//
//  BeerModel.swift
//  ProjectBeerYBeer
//
//  Created by Marilise Morona on 14/05/22.
//

import Foundation

struct Beer: Codable {
    
    let id: Int
    let name, tagline, first_brewed, description: String
    let image_url: String
    let abv: Double
    let ibu, target_fg, target_og, ebc: Int
    let srm, ph, attenuation_level: Double
    let volume, boil_volume: BoilVolume
    let method: Method
    let ingredients: Ingredients
    let food_pairing: [String]
    let brewers_tips, contributed_by: String
 
}

struct BoilVolume: Codable {
    let value: Double
    let unit: String
}

struct Ingredients: Codable {
    let malt: [Malt]
    let hops: [Hop]
    let yeast: String
}

struct Hop: Codable {
    let name: String
    let amount: BoilVolume
    let add, attribute: String
}

struct Malt: Codable {
    let name: String
    let amount: BoilVolume
}

struct Method: Codable {
    let mash_temp: [MashTemp]
    let fermentation: Fermentation
    let twist: String?
}
struct Fermentation: Codable {
    let temp: BoilVolume
}

struct MashTemp: Codable {
    let temp: BoilVolume
    let duration: Int
}

