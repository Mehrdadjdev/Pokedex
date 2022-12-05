//
//  PokedexListView.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct PokedexListView: View {
    
    @ObservedObject var pokemonVM: PokedexViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<6, id: \.self) { _ in
                    PokedexRow()
                }
            }
            .navigationTitle("Pokedex")
        }
        .navigationViewStyle(.stack)
    }
}

struct PokedexListView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexListView(pokemonVM: PokedexViewModel())
    }
}
