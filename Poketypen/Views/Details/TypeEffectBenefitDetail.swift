//
//  TypeEffectAttackDetail.swift
//  Poketypen
//
//  Created by David Thierbach on 14.04.23.
//

import SwiftUI

struct TypeEffectBenefitDetail: View {

    var poketype: Poketype
    var pokemonAttackedList: [PokemonAttackedViewModel]
    
    init(poketype: Poketype) {
        self.poketype = poketype
        let superStrongList =  PokemonAttackedViewModel(poketype: poketype, text: "Sehr stark gegen: ", effectivenessType: .superStrongType)
        let strongList =  PokemonAttackedViewModel(poketype: poketype, text: "Stark gegen: ", effectivenessType: .strongType)
        let weakList =  PokemonAttackedViewModel(poketype: poketype, text: "Schwach gegen: ", effectivenessType: .weakType)
        let superWeakList =  PokemonAttackedViewModel(poketype: poketype, text: "Sehr schach gegen: ", effectivenessType: .superWeakType)
        let noDamageList =  PokemonAttackedViewModel(poketype: poketype, text: "Fügt keinen Schaden zu: ", effectivenessType: .noDamageType)
        pokemonAttackedList = [superStrongList,
                               strongList,
                               weakList,
                               superWeakList,
                               noDamageList]
        print("weaklist generated!")
    }
    var body: some View {
        VStack(alignment: .center) {
            Text("Pokemon mit dem Typ")
            HStack {
                PokemonTypeView(pokemonType: poketype)
            }
            Text("fügen folgenden Schaden zu")
                .multilineTextAlignment(.center)
            
            List(pokemonAttackedList, children: \.children) {row in
                HStack {
                    if let mixedType = row.mixedType {
                        GeneralPokemonItemView(mixedPokemonType: mixedType, stackingAlignment: .horizontal)
                    } else {
                        Text(row.text)
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("Angriffe")
    }
}

struct TypeEffectBenefitDetail_Previews: PreviewProvider {
    static var previews: some View {
        TypeEffectBenefitDetail(poketype: Poketype.boden)
    }
}
