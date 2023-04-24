//
//  PokeTypeProtocol.swift
//  Poketypen
//
//  Created by David Thierbach on 04.01.23.
//

import Foundation

protocol PokeTypeProtocol {
    func createPokemonList() -> [MixedPoketype]
}

//Pre-building a struct of this protocol
extension PokeTypeProtocol where Self: PokemonGeneralModel {
    
    /// Creating lists of Pokemon and merge them
    /// - Returns: Returns a list of MixedPokemon (type1, type2 and rank)
    func createPokemonList() -> [MixedPoketype] {
        var mixedTypeList: [MixedPoketype] = []
        var restList = Poketype.listAllTypes
        for type1 in Poketype.listAllTypes {
            mixedTypeList.append(generateMixedPoketype(by: type1))
            restList = restList.filter { $0 != type1}
            
            for type2 in restList {
                mixedTypeList.append(generateMixedPoketype(by: type1, and: type2))
            }
        }
        print("Creation is done!")
        return mixedTypeList
    }
    
    /// Adding a List of pokemon with one specific type as type1
    /// - Parameter type: specific Poketype
    /// - Returns: List of MixedPokemon(type1, type2, rank)
    func createPokemonList(for type: Poketype) -> [MixedPoketype] {
        var restList = Poketype.listAllTypes
        var mixedTypeList: [MixedPoketype] = []
        
        mixedTypeList.append(generateMixedPoketype(by: type))
        restList = restList.filter { $0 != type}
        
        for type2 in restList {
            mixedTypeList.append(generateMixedPoketype(by: type, and: type2))
        }
        return mixedTypeList
    }
    
    /// Creates a mixedPokemontype matching given types
    /// - Parameters:
    ///   - type1: First Pokemontype
    ///   - type2: Second Pokemontype (optional). If nil this is pure first type
    /// - Returns: Element of MixedPoketype
    func generateMixedPoketype(by type1: Poketype, and type2: Poketype? = nil) -> MixedPoketype {
        return MixedPoketype(type1: type1, type2: type2)
    }
    
    /// Filters shown Pokemontype lists.
    ///  Shows all possible pokemon if there is no filter on it.
    ///  If only one filter is active it shows this filter as the main type and adds all other types to it
    ///  If both types are listed, it only creats a pokemon with this specific typing
    /// - Parameters:
    ///   - type1: Poketype
    ///   - type2: Poketype
    /// - Returns: List of Pokemon with the given type(s)
    func filterPokemonList(for type1: Poketype? = nil, and type2: Poketype? = nil) -> [MixedPoketype] {
        if let type1 = type1, let type2 = type2 {
            if type1 == type2 {
                return [generateMixedPoketype(by: type1, and: Poketype.none)]
            } else {
                return [generateMixedPoketype(by: type1, and: type2)]
            }
        } else if let type1 = type1 {
            return createPokemonList(for: type1)
        } else if let type2 = type2 {
            return createPokemonList(for: type2)
        } else {
            return createPokemonList()
        }
        
        
        
    }
}
