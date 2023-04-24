//
//  AttackEffectiveness.swift
//  Poketypen
//
//  Created by David Thierbach on 20.04.23.
//

import SwiftUI

enum AttackEffectiveness: Codable {
    case superStrongType
    case strongType
    case weakType
    case superWeakType
    case noDamageType
    
    var loadEffectivenessImageName: String {
        switch self {
        case .superStrongType: return "AttackSuperStrongRight"
        case .strongType: return "AttackStrongRight"
        case .weakType: return "AttackWeakRight"
        case .superWeakType: return "AttackSuperWeakRight"
        case .noDamageType: return "AttackZeroRight"
        }
    }
    
    var backgroundColor: Color {
        return Color.gray.opacity(0.05)
    }
    
    /// Load all possible Types and find the resistances from them. Then filter the current effectiveness in the opposite way
    /// - Parameter type: type of the attack
    /// - Returns: List of Pokemon with two types which fulfills the request.
    func loadMixedList(for type: Poketype) -> [MixedPoketype] {
        
        let mixedPokemonList = PokemonGeneralModel().createPokemonList()
        let filteredPokeList = mixedPokemonList.filter { mixedPokemon in
            switch self {
            case .superStrongType:
                return mixedPokemon.superWeakAgainst.contains(type)
            case .strongType:
                return mixedPokemon.weakAgainst.contains(type)
            case .weakType:
                return mixedPokemon.resistAgainst.contains(type)
            case .superWeakType:
                return mixedPokemon.strongResistAgainst.contains(type)
            case .noDamageType:
                return mixedPokemon.noDamageFrom.contains(type)
            }
        }
        // easy way to remove doubled elements
        return Array(Set(filteredPokeList))
    }
    
    func loadSimpleList(for type: Poketype) -> [Poketype] {
        switch self {
        case .superStrongType, .strongType:
            return type.strongVersus
        case .weakType, .superWeakType:
            return type.weakVersus
        case .noDamageType:
            return type.noDamageVS
        }
    }
}
