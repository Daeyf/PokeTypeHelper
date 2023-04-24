//
//  MixedPoketyp.swift
//  Poketypen
//
//  Created by David Thierbach on 04.11.22.
//

import SwiftUI
import Combine

struct MixedPoketype: Identifiable, Hashable, Codable {
    var id = UUID()
    var type1: Poketype
    var type2: Poketype?
    var rank: Int
    
    /// Gibt die Liste zurück, die mindestens den doppelten Schaden gegen den eigenen Typ anrichten
    var weakAgainst: [Poketype] {
        return DefenseEffectiveness.weakType.loadList(for: self.type1, and: self.type2)
    }
    
    /// Gibt die Liste zurück, die den vierfachen Schaden gegen den eigenen Typ anrichten
    var superWeakAgainst: [Poketype] {
        return DefenseEffectiveness.superWeakType.loadList(for: self.type1, and: self.type2)
    }
    
    /// Gibt die Liste zurück, die mindestens den halben Schaden gegen den eigenen Typ anrichten
    var resistAgainst: [Poketype] {
        return DefenseEffectiveness.strongType.loadList(for: self.type1, and: self.type2)
    }
    
    /// Gibt die Liste zurück, die ein viertel Schaden gegen den eigenen Typ anrichten
    var strongResistAgainst: [Poketype] {
        return DefenseEffectiveness.superStrongType.loadList(for: self.type1, and: self.type2)
    }
    
    /// Gibt die Liste zurück, die keinen Schaden gegen den eigenen Typ anrichten
    var noDamageFrom: [Poketype] {
        return DefenseEffectiveness.noDamageType.loadList(for: self.type1, and: self.type2)
    }
    
    init(id: UUID = UUID(), type1: Poketype, type2: Poketype? = nil, rank: Int) {
        self.id = id
        self.type1 = type1
        self.type2 = type2
        self.rank = rank
    }
    
    init() {
        self.id = UUID()
        self.type1 = Poketype.none
        self.type2 = nil
        self.rank = MixedPoketype.calculateRank(for: .none, and: nil)
    }
    
    /// Counts all types where this type sustains and reduces the count where this type takes at least double damage
    /// - Returns: The calculated resisting vs susceptible types exist for this type of Pokemon
    static func calculateRank(for type1: Poketype, and type2: Poketype?) -> Int {
        var rankNumber: Int = 0
        
        rankNumber -= DefenseEffectiveness.weakType.loadList(for: type1, and: type2).count
        rankNumber -= DefenseEffectiveness.superWeakType.loadList(for: type1, and: type2).count
        
        rankNumber += DefenseEffectiveness.strongType.loadList(for: type1, and: type2).count
        rankNumber += DefenseEffectiveness.superStrongType.loadList(for: type1, and: type2).count
        rankNumber += DefenseEffectiveness.noDamageType.loadList(for: type1, and: type2).count * 2
        
        return rankNumber
    }
}

extension MixedPoketype: Comparable {
    static func < (lhs: MixedPoketype, rhs: MixedPoketype) -> Bool {
        return lhs.rank < rhs.rank
    }
    
    static func == (lhs: MixedPoketype, rhs: MixedPoketype) -> Bool {
        return lhs.rank == rhs.rank
    }
    
}

