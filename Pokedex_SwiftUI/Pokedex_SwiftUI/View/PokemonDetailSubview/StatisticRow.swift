//
//  StatisticRow.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct StatisticRow: View {
    
    let stat: Stat
    let type: String
    let titles = ["hp" : "HP", "attack": "ATK", "defense": "DEF", "special-attack": "SATK", "special-defense": "SDEF", "speed": "SPD",]
    
    var body: some View {
        HStack {
            Text((titles[stat.stat.name] ?? "N/A") + ":")
                .frame(width: 50,alignment: .leading)
            
            Text(String(format: "%03d", stat.baseStat))
            
            ProgressView(value: Float64(stat.baseStat), total: 200)
                .frame(width: UIScreen.main.bounds.width - 150)
                .progressViewStyle(.linear)
                .tint(Color(type))
                .scaleEffect(x: 1, y: 2, anchor: .center)
                
               
        }
    }
}
