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
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(searchResult, id: \.id) { pokemon in
                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon, pokemonVM: pokedexVM)) {
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
        .searchable(text: $searchText)
    }
    
    var searchResult: [Pokemon] {
        if searchText.isEmpty {
            return pokedexVM.pokemonList
        } else {
            return pokedexVM.pokemonList.filter { $0.name.contains(searchText.lowercased()) }
        }
    }
}

struct PokedexListView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexListView(pokedexVM: PokedexViewModel())
    }
}
