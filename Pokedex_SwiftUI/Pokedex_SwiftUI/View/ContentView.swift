//
//  ContentView.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct ContentView: View {

    @StateObject var pokedexVM = PokedexViewModel()
    var body: some View {
        
        TabView {
            PokedexListView(pokedexVM: pokedexVM)
                .tabItem {
                    Label("Pokedex", systemImage: "house")
                }
            PokedexFavoritesView(pokedexVM: pokedexVM)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
        .accentColor(.red)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
