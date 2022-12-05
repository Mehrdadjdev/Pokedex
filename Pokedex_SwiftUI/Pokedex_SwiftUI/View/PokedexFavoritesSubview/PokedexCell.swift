//
//  PokedexCell.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct PokedexCell: View {
    
    let width = UIScreen.main.bounds.width
    let name = "bulbausaur"
    let type = "fire"
    
    var body: some View {
        VStack {
            
            Image("bulbausaur")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .background { Circle().fill(Color.white) }
                .padding(.top, 4)
            
            Text(name)
                .foregroundColor(.white)
            
        }
        .frame(width: (width / 3) - 10, height: (width / 3) - 10)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(type))
        }
    }
}

struct PokedexCell_Previews: PreviewProvider {
    static var previews: some View {
        PokedexCell()
    }
}
