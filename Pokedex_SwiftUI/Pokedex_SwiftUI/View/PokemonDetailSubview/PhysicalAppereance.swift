//
//  PhysicalAppereance.swift
//  Pokedex_SwiftUI
//
//  Created by MehrDad on 05.12.2022.
//

import SwiftUI

struct PhysicalAppereance: View {
    
    let title : String
    let value: Int
    
    var body: some View {
        VStack {
            HStack {
                Image(title)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                Text(getformattedValue(value: value) + (title == "weight" ? "Kg" : "m"))
                    .font(.system(size: 17))
            }
            
            Text(title)
                .font(.system(size: 15))
                .foregroundColor(.gray)
        }
    }
    
    func getformattedValue(value: Int) -> String {
        let valueDouble = Double(value) / 10
        
        return String(format: "%.2f", valueDouble)
    }
}
