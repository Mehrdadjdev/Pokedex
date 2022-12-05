//
//  PokedexCell.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct PokedexCell: View {
    
    let width = UIScreen.main.bounds.width
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
            .frame(width: 80)
            .background { Circle().fill(Color.white) }
            .padding(.top, 4)
            
            Text(pokemon.name)
                .foregroundColor(.white)
            
        }
        .frame(width: (width / 3) - 10, height: (width / 3) - 10)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(pokemon.types[0].type.name))
        }
    }
}

//struct PokedexCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PokedexCell()
//    }
//}
