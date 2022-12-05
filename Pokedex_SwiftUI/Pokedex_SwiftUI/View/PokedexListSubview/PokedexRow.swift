//
//  PokedexRow.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct PokedexRow: View {
    
    let name = "bulbausaur"
    let id = 1
    let type = "grass"
    
    var body: some View {
        VStack {
            Image(name)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .background {
                    Circle().foregroundColor(.white)
                }
            
            Text(name)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("#\(String(format: "%03d", id))")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .frame(height: 180)
        .frame(maxWidth: .infinity)
        .background(Color(type))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct PokedexRow_Previews: PreviewProvider {
    static var previews: some View {
        PokedexRow()
    }
}
