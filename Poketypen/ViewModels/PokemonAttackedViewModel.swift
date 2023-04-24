//
//  PokemonAttackedViewModel.swift
//  Poketypen
//
//  Created by David Thierbach on 20.04.23.
//

import Foundation

struct PokemonAttackedViewModel: Identifiable {
    
    let id = UUID()
    var text: String
    var poketype: Poketype
    var mixedType: MixedPoketype?
    var effectivenessType: AttackEffectiveness
    var children: [PokemonAttackedViewModel]?
    
    init(poketype: Poketype, text: String, effectivenessType: AttackEffectiveness) {
        self.poketype = poketype
        self.text = text
        self.effectivenessType = effectivenessType
        let effectivenessList = effectivenessType.loadMixedList(for: poketype)
        var children: [PokemonAttackedViewModel] = []
        for mixedType in effectivenessList {
            let childModel = PokemonAttackedViewModel(poketype: poketype, effectivenessType: effectivenessType, mixedType: mixedType)
            children.append(childModel)
            print("Child \(mixedType.type1) and \(mixedType.type2) was created!")
        }
        self.children = children
    }
        
        init(poketype: Poketype, effectivenessType: AttackEffectiveness, mixedType: MixedPoketype) {
            self.text = ""
            self.poketype = poketype
            self.mixedType = mixedType
            self.effectivenessType = effectivenessType
            self.children = nil
        }
}
