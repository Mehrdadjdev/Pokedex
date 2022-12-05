//
//  FavoritesView.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct PokedexFavoritesView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0..<8) { _ in
                        PokedexCell()
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct PokedexFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexFavoritesView()
    }
}
