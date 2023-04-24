//
//  PokemonTypeView.swift
//  Poketypen
//
//  Created by David Thierbach on 03.01.23.
//

import SwiftUI

struct PokemonTypeView: View {
    let pokemonType: Poketype?
    let noNameText: String?
    
    init(pokemonType: Poketype? = nil, noNameText: String? = nil) {
        self.pokemonType = pokemonType
        self.noNameText = noNameText
    }
    
    var body: some View {
        if let pokemonType = pokemonType {
            Text(pokemonType.Name)
                .foregroundColor(Color.white)
                .padding(.horizontal)
                .padding(/*@START_MENU_TOKEN@*/.vertical, 5.0/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity)
                .background(pokemonType.color)
                .cornerRadius(10)
                .shadow(radius: 2)
        } else {
            Text(noNameText ?? Poketype.none.Name)
                .foregroundColor(Color.white)
                .padding(.horizontal)
                .padding(.vertical, 5.0)
                .frame(maxWidth: .infinity)
                .background(Poketype.none.color)
                .cornerRadius(10)
                .shadow(radius: 2)
        }
    }
}

struct PokemonTypeView_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            PokemonTypeView(pokemonType: Poketype.feuer)
            PokemonTypeView(pokemonType: nil)
        }
    }
}
