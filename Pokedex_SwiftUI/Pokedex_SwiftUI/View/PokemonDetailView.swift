//
//  PokemonDetailView.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct PokemonDetailView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        ZStack {
            Color(pokemon.types[0].type.name)
            
            VStack {
                Spacer()
                CardView(pokemon: pokemon)
                    .frame(height: UIScreen.main.bounds.height * 2/3)
                    .cornerRadius(36)
                    .padding(10)
            }
            
            VStack {
                Text(pokemon.name)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                
                AsyncImage(url: pokemon.sprites.other.officialArtwork.front_default) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Image(systemName: "questionmark.circle.fill")
                        .resizable()
                        .foregroundColor(.secondary)
                }
                .foregroundColor(.secondary)
                .frame(width: 200)
                    
                    
            }
            .offset(CGSize(width: 0, height: -(UIScreen.main.bounds.height * 1/4)))
            
        }
        .ignoresSafeArea()
    }
}

//struct PokemonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailView()
//    }
//}
