//
//  TypeEffectDetail.swift
//  Poketypen
//
//  Created by David Thierbach on 04.01.23.
//

import SwiftUI

struct TypeEffectDefenseDetail: View {

    var mixedPokemon: MixedPoketype
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Pokemon mit dem Typ")
            HStack {
                PokemonTypeView(pokemonType: mixedPokemon.type1)
                PokemonTypeView(pokemonType: mixedPokemon.type2)
            }
            Text("erhalten folgenden Schaden von Angriffen aus der rechten Spalte")
                .multilineTextAlignment(.center)
            
            ScrollView {
                VStack {
                    DefenseDetail(mixedPokemon: mixedPokemon, effectivenessType: .superWeakType)
                    
                    DefenseDetail(mixedPokemon: mixedPokemon, effectivenessType: .weakType)
                    
                    DefenseDetail(mixedPokemon: mixedPokemon, effectivenessType: .strongType)
                    
                    DefenseDetail(mixedPokemon: mixedPokemon, effectivenessType: .superStrongType)
                    
                    DefenseDetail(mixedPokemon: mixedPokemon, effectivenessType: .noDamageType)
                    Divider()
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("Resistenzen")
    }
    
    private func type2Text() -> String {
        if let type2 = mixedPokemon.type2 {
            return " und \(type2.Name)"
        } else {
            return ""
        }
    }
}

struct TypeEffectDefenseDetail_Previews: PreviewProvider {
    static var previews: some View {
        TypeEffectDefenseDetail(mixedPokemon: MixedPoketype(type1: Poketype.normal, type2: Poketype.feuer, rank: 2))
    }
}
