//
//  PokedexRow.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct PokedexRow: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            AsyncImage(url: pokemon.sprites.other.officialArtwork.front_default) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Image(systemName: "questionmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.secondary)
            }
            .frame(width: 100, height: 100)
            .background {
                Circle().foregroundColor(.white)
            }
            
            Text(pokemon.name)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("#\(String(format: "%03d", pokemon.id))")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .frame(height: 180)
        .frame(maxWidth: .infinity)
        .background(Color(pokemon.types[0].type.name))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

//struct PokedexRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PokedexRow(pokemon: Pokemon()
//    }
//}
