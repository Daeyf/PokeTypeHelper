//
//  PoketypeEffectiveness.swift
//  Poketypen
//
//  Created by David Thierbach on 27.01.23.
//

import SwiftUI

enum DefenseEffectiveness: Codable {
    case superStrongType
    case strongType
    case weakType
    case superWeakType
    case noDamageType
    
    var loadEffectivenessImageName: String {
        switch self {
        case .superStrongType: return "DefenseSuperStrongLeft"
        case .strongType: return "DefenseStrongLeft"
        case .weakType: return "DefenseWeakLeft"
        case .superWeakType: return "DefenseSuperWeakLeft"
        case .noDamageType: return "AttackZeroLeft"
        }
    }
    
    var backgroundColor: Color {
//        switch self {
//        case .superStrongType:
//            let color = Color(hex: "#57A950ff") ?? Color.green
//            return color.opacity(0.4)
//        case .strongType:
//
//            let color = Color(hex: "#57A950ff") ?? Color.green
//            return color.opacity(0.15)
//        case .weakType:
//            let color = Color(hex: "#E53B18ff") ?? Color.green
//            return color.opacity(0.15)
//        case .superWeakType:
//            let color = Color(hex: "#E53B18ff") ?? Color.green
//            return color.opacity(0.4)
//        case .noDamageType:
//            let color = Color(hex: "#57A950ff") ?? Color.green
//            return color.opacity(0.5)
//        }
        return Color.gray.opacity(0.05)
    }
    
    func loadList(for type1: Poketype, and type2: Poketype? = nil) -> [Poketype] {
        switch self {
        case .superStrongType: return self.strongResistList(for: type1, and: type2)
        case .strongType: return self.resistAgainstList(for: type1, and: type2)
        case .weakType: return self.weakList(for: type1, and: type2)
        case .superWeakType: return self.superWeakList(for: type1, and: type2)
        case .noDamageType: return self.noDamageList(for: type1, and: type2)
        }
    }
    
    private func weakList(for type1: Poketype, and type2: Poketype?) -> [Poketype] {
        
        guard let type2 = type2 else {
            return type1.weakAgainst
        }
        var anfaelligList = type1.weakAgainst
        anfaelligList.append(contentsOf: type2.weakAgainst)
        anfaelligList = anfaelligList.filter { anfaelligElement in
            if type2.resistAgainst.contains(anfaelligElement)
                || type1.resistAgainst.contains(anfaelligElement)
                || type2.noDamageFrom.contains(anfaelligElement)
                || type1.noDamageFrom.contains(anfaelligElement){
                return false
            }
            return true
        }
        return Array(Set(anfaelligList))
    }
    
    private func superWeakList(for type1: Poketype, and type2: Poketype?) -> [Poketype] {
        guard let type2 = type2 else {
            return []
        }
        
        var anfaelligList = type1.weakAgainst.filter { type2.weakAgainst.contains($0)}
        anfaelligList = anfaelligList.filter { !noDamageList(for: type1, and: type2).contains($0)}
        
        return Array(Set(anfaelligList))
    }
    
    private func resistAgainstList(for type1: Poketype, and type2: Poketype?) -> [Poketype] {
        guard let type2 = type2 else {
            return type1.resistAgainst
        }
        var robustList = type1.resistAgainst
        robustList.append(contentsOf: type2.resistAgainst)
        robustList = robustList.filter { !noDamageList(for: type1, and: type2).contains($0)}
        
        robustList = robustList.filter { robustElement in
            if type2.weakAgainst.contains(robustElement)
                || type1.weakAgainst.contains(robustElement)
                || type2.noDamageFrom.contains(robustElement)
                || type1.noDamageFrom.contains(robustElement) {
                return false
            }
            return true
        }
        return Array(Set(robustList))
    }
    
    private func strongResistList(for type1: Poketype, and type2: Poketype?) -> [Poketype] {
        guard let type2 = type2 else {
            return []
        }
        
        var robustList = type1.resistAgainst.filter { type2.resistAgainst.contains($0)}
        robustList = robustList.filter { !noDamageList(for: type1, and: type2).contains($0)}
        
        return Array(Set(robustList))
    }
    
    private func noDamageList(for type1: Poketype, and type2: Poketype?) -> [Poketype] {
        var noDamageList = type1.noDamageFrom
        noDamageList.append(contentsOf: type2?.noDamageFrom ?? [])
        return noDamageList
    }
}
