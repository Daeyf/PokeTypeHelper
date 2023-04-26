//
//  Pokeliste.swift
//  Poketypen
//
//  Created by David Thierbach on 04.11.22.
//

import SwiftUI
import Combine

class RankViewController: PokemonGeneralModel, ObservableObject {
    
    @Published var rankItemList: [RankItemViewModel] = []
    
    override init() {
        super.init()
        
        for mixedPokemon in self.mixedPokemon {
            let uuid = UUID()
            let rankItem = RankItemViewModel(uuid: uuid, mixedPokemon: mixedPokemon)
            rankItemList.append(rankItem)
        }
    }
}
