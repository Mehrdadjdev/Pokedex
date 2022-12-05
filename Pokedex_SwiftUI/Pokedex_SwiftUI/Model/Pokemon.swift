//
//  Pokemon.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import Foundation

struct Pokemon: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id
    }
}

