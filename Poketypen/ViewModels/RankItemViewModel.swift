//
//  RankItemViewModel.swift
//  Poketypen
//
//  Created by David Thierbach on 24.04.23.
//

import SwiftUI

struct RankItemViewModel: Hashable {
    var uuid: UUID
    var mixedPokemon: MixedPoketype
    var rank: Int?
    
    
    init(uuid: UUID, mixedPokemon: MixedPoketype, rank: Int? = nil) {
        self.uuid = uuid
        self.mixedPokemon = mixedPokemon
        self.rank = rank
        
    }
}

extension RankItemViewModel: Comparable {
    static func < (lhs: RankItemViewModel, rhs: RankItemViewModel) -> Bool {
        if let rankLeft = lhs.rank,
           let rankRight = lhs.rank {
            return rankLeft < rankRight
        } else if let _ = lhs.rank {
            return true
        } else {
            return false
        }
    }
    
    static func == (lhs: RankItemViewModel, rhs: RankItemViewModel) -> Bool {
        return lhs.rank == rhs.rank
    }
    
}
