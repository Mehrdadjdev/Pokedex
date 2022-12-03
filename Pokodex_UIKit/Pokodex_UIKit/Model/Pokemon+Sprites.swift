//
//  Pokemon+Sprites.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import Foundation

struct Sprites: Codable {
    var front_default: URL
    let other: Other
    
    struct Other: Codable {
        let officialArtwork: OfficialArtwork
        
        enum CodingKeys: String, CodingKey {
            case officialArtwork = "official-artwork"
        }
        
        struct OfficialArtwork: Codable {
            let front_default: URL
        }
    }
}
