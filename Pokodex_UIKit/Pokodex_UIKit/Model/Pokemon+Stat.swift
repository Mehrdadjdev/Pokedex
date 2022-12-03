//
//  Pokemon+Stat.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import Foundation

struct Stat: Codable {
    let baseStat, effort: Int
    let stat: StatClass
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

struct StatClass: Codable {
    let name: String
    let url: String
}
