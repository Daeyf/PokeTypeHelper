//
//  AttackDetail.swift
//  Poketypen
//
//  Created by David Thierbach on 20.04.23.
//
//
import SwiftUI

struct AttackDetail: View {

    var poketype: Poketype
    var effectivenessType: AttackEffectiveness
    var effectiveness: [Poketype]
    
    init(poketype: Poketype, effectivenessType: AttackEffectiveness) {
        self.poketype = poketype
        self.effectivenessType = effectivenessType
        self.effectiveness = effectivenessType.loadSimpleList(for: poketype)
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
                        PokemonTypeView(pokemonType: poketype)
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

struct AttackDetail_Previews: PreviewProvider {
    static var previews: some View {
        AttackDetail(poketype: .boden, effectivenessType: .weakType)
    }
}
