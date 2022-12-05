//
//  FavoritesView.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct PokedexFavoritesView: View {
    
    @ObservedObject var pokedexVM: PokedexViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(pokedexVM.pokemonFavorites, id: \.id) { pokemon in
                        PokedexCell(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct PokedexFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexFavoritesView(pokedexVM: PokedexViewModel())
    }
}
