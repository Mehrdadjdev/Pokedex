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
    var isFavorite: Bool
    
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.height = try container.decode(Int.self, forKey: .height)
        self.weight = try container.decode(Int.self, forKey: .weight)
        self.sprites = try container.decode(Sprites.self, forKey: .sprites)
        self.stats = try container.decode([Stat].self, forKey: .stats)
        self.types = try container.decode([TypeElement].self, forKey: .types)
        self.isFavorite = false
    }
}

