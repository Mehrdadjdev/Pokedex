//
//  PokemonDetailView.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct PokemonDetailView: View {
    
    let name = "bulbausaur"
    let types = ["grass", "poison"]
    let stat = 35
    
    
    var body: some View {
        ZStack {
            Color(types[0])
            
            VStack {
                Spacer()
                CardView(types: types)
                    .frame(height: UIScreen.main.bounds.height * 2/3)
                    .cornerRadius(36)
                    .padding()
            }
            
            VStack {
                Text(name)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                
                Image(name)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.secondary)
                    .frame(width: 200)
            }
            .offset(CGSize(width: 0, height: -(UIScreen.main.bounds.height * 1/4)))
            
        }
        .ignoresSafeArea()
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView()
    }
}
