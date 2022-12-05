//
//  CardView.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct CardView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        ZStack {
            Color.white
              
            VStack(spacing: 20) {
                HStack(spacing: 30) {
                    ForEach(pokemon.types, id: \.slot) { type in
                        TypeView(type: type.type.name)
                    }
                }
                
                HStack(spacing: 30) {
                    
                    PhysicalAppereance(title: "weight", value: pokemon.weight)
                    
                    PhysicalAppereance(title: "height", value: pokemon.height)
                }
                
                VStack {
                    ForEach(pokemon.stats, id: \.stat.name) { stat in
                        StatisticRow(stat: stat, type: pokemon.types[0].type.name)
                            .padding(.vertical, 5)
                        Divider()
                            .padding(.horizontal, 35)
                    }
                }
            }
        }
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(types: ["grass", "fire"])
//    }
//}
