//
//  PokedexListView.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct PokedexListView: View {
    
    @ObservedObject var pokedexVM: PokedexViewModel
    @State private var viewDidLoad = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(pokedexVM.pokemonList, id: \.id) { pokemon in
                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                        PokedexRow(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokedex")
        }
        .navigationViewStyle(.stack)
        .onAppear {
            if viewDidLoad == false {
                viewDidLoad = true
                Task {
                    await pokedexVM.loadPokemons(firstCall: true)
                }
            }
        }
    }
}

struct PokedexListView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexListView(pokedexVM: PokedexViewModel())
    }
}
