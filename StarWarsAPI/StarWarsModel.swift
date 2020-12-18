//
//  StarWarsModel.swift
//  StarWarsAPI
//
//  Created by Field Employee on 12/18/20.
//

import Foundation

struct StarWarsResults: Decodable {
  let results: [StarWars]
}
struct StarWars: Decodable {
    let name: String
    let eye_color: URL
    let hair_color: String
    let homeworld: URL
}








