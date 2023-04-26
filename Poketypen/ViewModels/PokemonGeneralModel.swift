//
//  PokemonGeneralModel.swift
//  Poketypen
//
//  Created by David Thierbach on 04.01.23.
//

import SwiftUI
import Combine

class PokemonGeneralModel: PokeTypeProtocol{
    
    @Published var mixedPokemon: [MixedPoketype] = []
    @Published var mixedPokemonCount: Int = 0
    
    @Published var poketype: [Poketype] = []
    @Published var poketypeCount: Int = 0
    
    init() {
        mixedPokemon = self.createPokemonList()
        mixedPokemonCount = self.mixedPokemon.count
        
        poketype = Poketype.listAllElements
        poketypeCount = self.poketype.count
    }
}
