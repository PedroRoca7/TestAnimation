//
//  PokemonModel.swift
//  test
//
//  Created by Pedro Henrique on 27/02/24.
//

import Foundation

typealias PokemonsModel = [PokemonModel]

struct PokemonModel: Codable {
    let id: Int
    let type: Int
    let about: String
    let amount: Double
}

