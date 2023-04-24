//
//  RankItemViewModel.swift
//  Poketypen
//
//  Created by David Thierbach on 24.04.23.
//

import Foundation

struct RankItemViewModel {
    var mixedPokemon: MixedPoketype
    var rank: Int
}

extension RankItemViewModel: Comparable {
    static func < (lhs: RankItemViewModel, rhs: RankItemViewModel) -> Bool {
        return lhs.rank < rhs.rank
    }
    
    static func == (lhs: RankItemViewModel, rhs: RankItemViewModel) -> Bool {
        return lhs.rank == rhs.rank
    }
    
}
