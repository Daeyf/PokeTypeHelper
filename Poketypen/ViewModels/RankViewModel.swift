//
//  Pokeliste.swift
//  Poketypen
//
//  Created by David Thierbach on 04.11.22.
//

import SwiftUI
import Combine

class RankViewModel: PokemonGeneralModel, ObservableObject {
    
    @Published var rankItemList: [RankItemViewModel] = []
    
    override init() {
        super.init()
    }
}
