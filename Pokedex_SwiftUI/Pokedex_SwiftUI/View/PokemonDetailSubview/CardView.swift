//
//  CardView.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct CardView: View {
    
    let types: [String]
    let weight = 69
    let height = 69
    let stat = Stat(baseStat: 69, effort: 0, stat: StatClass(name: "hp", url: ""))
    
    var body: some View {
        ZStack {
            Color.white
              
            VStack(spacing: 20) {
                HStack(spacing: 30) {
                    ForEach(types, id: \.self) { type in
                        TypeView(type: type)
                    }
                }
                
                HStack(spacing: 30) {
                    
                    PhysicalAppereance(title: "weight", value: weight)
                    
                    PhysicalAppereance(title: "height", value: height)
                }
                
                VStack {
                    ForEach(0..<6) { _ in
                        StatisticRow(stat: stat, type: types[0])
                            .padding(.vertical, 5)
                        Divider()
                            .padding(.horizontal, 35)
                    }
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(types: ["grass", "fire"])
    }
}
