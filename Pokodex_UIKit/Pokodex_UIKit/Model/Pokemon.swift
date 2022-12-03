//
//  Pokemon.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import Foundation

struct Pokemon: Identifiable, Codable, Equatable {
    var id: Int
    var name: String
    var height: Int
    var weight: Int
    var sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id
    }
}

