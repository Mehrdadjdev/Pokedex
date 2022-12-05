//
//  TypeView.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct TypeView: View {
    
    let type: String
    
    var body: some View {
        Text(type)
            .foregroundColor(.white)
            .font(.system(size: 18))
            .frame(width: 100, height: 30, alignment: .center)
            .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color(type))
        }
    }
}
