//
//  PoketypeOrder.swift
//  Poketypen
//
//  Created by David Thierbach on 26.01.23.
//

import Foundation

enum PoketypeOrder: Codable {
    case first
    case second
    case single
    
    var orderText: String {
        switch self {
        case .first: return "Typ 1"
        case .second: return "Typ 2"
        case .single: return "Typ"
        }
    }
}
