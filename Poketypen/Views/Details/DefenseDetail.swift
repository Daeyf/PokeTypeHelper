//
//  EffectivnessView.swift
//  Poketypen
//
//  Created by David Thierbach on 04.01.23.
//

import SwiftUI

struct DefenseDetail: View {

    var mixedPokemon: MixedPoketype
    var effectivenessType: DefenseEffectiveness
    var effectiveness: [Poketype]
    
    init(mixedPokemon: MixedPoketype, effectivenessType: DefenseEffectiveness) {
        self.mixedPokemon = mixedPokemon
        self.effectivenessType = effectivenessType
        self.effectiveness = effectivenessType.loadList(for: mixedPokemon.type1, and: mixedPokemon.type2)
    }
    
    var body: some View {
        if !effectiveness.isEmpty {
            VStack {
                Divider()
                HStack(alignment: .center) {
                    VStack(alignment: .center) {
                        Image("Schild.SFSymbol")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30.0)
                            .opacity(0.6)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    Spacer()
                        .frame(width: 20)
                    VStack {
                        Image("Schwert.SFSymbol")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 30.0)
                            .opacity(0.6)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                HStack {
                    
                    VStack {
                        GeneralPokemonItemView(mixedPokemonType: mixedPokemon, stackingAlignment: .vertical)
                    }
                    VStack {
                        Image(effectivenessType.loadEffectivenessImageName)
                            .resizable(resizingMode: .stretch)
                            .frame(width: 60.0, height: 60.0)
                    }
                    VStack {
                        ForEach(effectiveness) {item in
                            PokemonTypeView(pokemonType: item)
                        }
                    }
                }
                .padding(.all)
                
            }
            .padding(.vertical, 2.0)
            .background(effectivenessType.backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 2)
        }
    }
}

struct DefenseDetail_Previews: PreviewProvider {
    static var previews: some View {
        let mixedPokemon = MixedPoketype(type1: Poketype.normal, type2: Poketype.feuer)
        DefenseDetail(mixedPokemon: mixedPokemon, effectivenessType: .weakType)
    }
}
