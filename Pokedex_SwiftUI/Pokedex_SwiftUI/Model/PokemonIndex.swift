//
//  PokemonIndex.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import Foundation

struct PokemonIndex: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [PokemonAnchor]
    
    struct PokemonAnchor: Codable {
        let name: String
        let url: URL
    }
}
