//
//  Poketyp.swift
//  Poketypen
//
//  Created by David Thierbach on 04.11.22.
//
// Model is simulated by an enum

import SwiftUI
import UIKit

enum Poketype: Codable {
    case none
    case normal
    case kampf
    case flug
    case gift
    case boden
    case gestein
    case kaefer
    case geist
    case stahl
    case feuer
    case wasser
    case pflanze
    case elektro
    case psycho
    case eis
    case drache
    case unlicht
    case fee
    
    /// List of "Poketyp". It contains all types in single form.
    static var listAllTypes: [Poketype] = [
        .normal, .feuer, .wasser,
        .pflanze, .elektro, .flug, .kampf,
        .boden, .gift, .kaefer, .gestein,
        .geist, .psycho, .stahl, .eis,
        .drache, .unlicht, .fee]
    
    /// List of "Poketyp". It contains all elements of Pokeytype included "none"
    static var listAllElements: [Poketype] = [
        .none, .normal, .feuer, .wasser,
        .pflanze, .elektro, .flug, .kampf,
        .boden, .gift, .kaefer, .gestein,
        .geist, .psycho, .stahl, .eis,
        .drache, .unlicht, .fee]
    
    /// returns a text with the type name of the pokemon
    var Name: String {
        switch self {
        case .normal:  return "Normal"
        case .kampf:   return "Kampf"
        case .flug:    return "Flug"
        case .gift:    return "Gift"
        case .boden:   return "Boden"
        case .gestein: return "Gestein"
        case .kaefer:  return "Käfer"
        case .geist:   return "Geist"
        case .stahl:   return "Stahl"
        case .feuer:   return "Feuer"
        case .wasser:  return "Wasser"
        case .pflanze: return "Pflanze"
        case .elektro: return "Elektro"
        case .psycho:  return "Psycho"
        case .eis:     return "Eis"
        case .drache:  return "Drache"
        case .unlicht: return "Unlicht"
        case .fee:     return "Fee"
        case .none:
            return "None"
        }
    }
    
    var realType: Poketype? {
        switch self {
        case .none: return nil
        default: return self
        }
    }
    
    /// Gibt die Liste zurück, die doppelten Schaden gegen den eigenen Typ anrichten
    var weakAgainst: [Poketype] {
        switch self {
        case .normal:
            return [.kampf]
        case .kampf:
            return [.flug, .psycho, .fee]
        case .flug:
            return [.gestein, .elektro, .eis]
        case .gift:
            return [.boden, .psycho]
        case .boden:
            return [.wasser, .pflanze, .eis]
        case .gestein:
            return [.kampf, .boden, .stahl, .wasser, .pflanze]
        case .kaefer:
            return [.flug, .gestein, .feuer]
        case .geist:
            return [.geist, .unlicht]
        case .stahl:
            return [.kampf, .boden, .feuer]
        case .feuer:
            return [.wasser, .boden, .gestein]
        case .wasser:
            return [.pflanze, .elektro]
        case .pflanze:
            return [.flug, .gift, .kaefer, .feuer, .eis]
        case .elektro:
            return [.boden]
        case .psycho:
            return [.kaefer, .geist, .unlicht]
        case .eis:
            return [.kampf, .gestein, .stahl, .feuer]
        case .drache:
            return [.eis, .drache, .fee]
        case .unlicht:
            return [.kampf, .kaefer, .fee]
        case .fee:
            return [.gift, .stahl]
        case .none:
            return []
        }
    }
    
    /// Gibt die Liste zurück, die halben (oder keinen) Schaden gegen den eigenen Typ anrichten
    var resistAgainst: [Poketype] {
        switch self {
        case .normal:
            return []
        case .kampf:
            return [.gestein, .kaefer, .unlicht]
        case .flug:
            return [.kampf, .kaefer, .pflanze]
        case .gift:
            return [.kampf, .gift, .kaefer, .pflanze]
        case .boden:
            return [.gift, .gestein, ]
        case .gestein:
            return [.normal, .flug, .gift, .feuer]
        case .kaefer:
            return [.kampf, .boden, .pflanze]
        case .geist:
            return [.gift, .kaefer]
        case .stahl:
            return [.normal, .flug, .gestein, .kaefer, .stahl, .pflanze, .psycho, .eis, .drache, .fee]
        case .feuer:
            return [.kaefer, .stahl, .feuer, .pflanze, .eis, .fee]
        case .wasser:
            return [.stahl, .feuer, .wasser, .eis]
        case .pflanze:
            return [.boden, .wasser, .pflanze, .elektro]
        case .elektro:
            return [.flug, .stahl, .elektro]
        case .psycho:
            return [.kampf, .psycho]
        case .eis:
            return [.eis]
        case .drache:
            return [.feuer, .wasser, .pflanze, .elektro]
        case .unlicht:
            return [.geist, .unlicht]
        case .fee:
            return [.kampf, .kaefer, .unlicht]
        case .none:
            return []
        }
    }
    
    /// Gibt die Liste zurück, die keinen Schaden gegen den eigenen Typ anrichten
    var noDamageFrom: [Poketype] {
        switch self {
        case .normal:
            return [.geist]
        case .kampf:
            return []
        case .flug:
            return [.boden]
        case .gift:
            return []
        case .boden:
            return [.elektro]
        case .gestein:
            return []
        case .kaefer:
            return []
        case .geist:
            return [.normal, .kampf]
        case .stahl:
            return [.gift]
        case .feuer:
            return []
        case .wasser:
            return []
        case .pflanze:
            return []
        case .elektro:
            return []
        case .psycho:
            return []
        case .eis:
            return []
        case .drache:
            return []
        case .unlicht:
            return [.psycho]
        case .fee:
            return [.drache]
        case .none:
            return []
        }
    }
    
    /// Gibt eine Liste zurück, welche doppelten Schaden gegen diese Typen austeilt
    var strongVersus: [Poketype] {
        switch self {
        case .none:
            return []
        case .normal:
            return []
        case .kampf:
            return [.normal, .gestein, .stahl, .eis, .unlicht]
        case .flug:
            return [.kampf, .kaefer, .pflanze]
        case .gift:
            return [.pflanze, .fee]
        case .boden:
            return [.gift, .gestein, .stahl, .feuer, .elektro]
        case .gestein:
            return [.flug, .kaefer, .feuer, .eis]
        case .kaefer:
            return [.pflanze, .psycho, .unlicht]
        case .geist:
            return [.geist, .psycho]
        case .stahl:
            return [.gestein, .eis, .fee]
        case .feuer:
            return [.kaefer, .stahl, .pflanze, .eis]
        case .wasser:
            return [.boden, .gestein, .feuer]
        case .pflanze:
            return [.boden, .gestein, .wasser]
        case .elektro:
            return [.flug, .wasser]
        case .psycho:
            return [.kampf, .gift]
        case .eis:
            return [.flug, .boden, .pflanze, .drache]
        case .drache:
            return [.drache]
        case .unlicht:
            return [.geist, .psycho]
        case .fee:
            return [.kampf, .drache, .unlicht]
        }
    }
    
    /// Gibt eine Liste zurück, welche halben Schaden gegen diese Typen austeilt
    var weakVersus: [Poketype] {
        switch self {
        case .none:
            return []
        case .normal:
            return [.gestein, .stahl]
        case .kampf:
            return [.flug, .gift, .kaefer, .psycho, .fee]
        case .flug:
            return [.gestein, .stahl, .elektro]
        case .gift:
            return [.gift, .boden, .gestein, .geist]
        case .boden:
            return [.kaefer, .pflanze]
        case .gestein:
            return [.kampf, .boden, .stahl]
        case .kaefer:
            return [.kampf, .flug, .gift, .geist, .stahl, .feuer, .fee]
        case .geist:
            return [.unlicht]
        case .stahl:
            return [.stahl, .feuer, .wasser, .elektro]
        case .feuer:
            return [.gestein, .feuer, .wasser, .drache]
        case .wasser:
            return [.wasser, .pflanze, .drache]
        case .pflanze:
            return [.flug, .gift, .kaefer, .stahl, .feuer, .pflanze, .drache]
        case .elektro:
            return [.pflanze, .elektro, .drache]
        case .psycho:
            return [.stahl, .psycho]
        case .eis:
            return [.stahl, .feuer, .wasser, .eis]
        case .drache:
            return [.stahl]
        case .unlicht:
            return [.kampf, .unlicht, .fee]
        case .fee:
            return [.gift, .stahl, .feuer]
        }
    }
    
    /// Gibt die Liste zurück, welche keinen Schaden gegen diesen Typ ausrichten
    var noDamageVS: [Poketype] {
        switch self {
        case .normal:
            return [.geist]
        case .kampf:
            return [.geist]
        case .flug:
            return []
        case .gift:
            return [.stahl]
        case .boden:
            return [.flug]
        case .gestein:
            return []
        case .kaefer:
            return []
        case .geist:
            return [.normal]
        case .stahl:
            return [.gift]
        case .feuer:
            return []
        case .wasser:
            return []
        case .pflanze:
            return []
        case .elektro:
            return [.boden]
        case .psycho:
            return [.unlicht]
        case .eis:
            return []
        case .drache:
            return [.fee]
        case .unlicht:
            return []
        case .fee:
            return []
        case .none:
            return []
        }
    }
    
    var color: Color {
        switch self {
        case .normal:
            return Color(hex: "#A8A898ff") ?? Color.green
        case .kampf:
            return Color(hex: "#A84B3Dff") ?? Color.green
        case .flug:
            return Color(hex: "#87B5E5ff") ?? Color.green
        case .gift:
            return Color(hex: "#864AB8ff") ?? Color.green
        case .boden:
            return Color(hex: "#946833ff") ?? Color.green
        case .gestein:
            return Color(hex: "#A7995Bff") ?? Color.green
        case .kaefer:
            return Color(hex: "#83AD25ff") ?? Color.green
        case .geist:
            return Color(hex: "#623C64ff") ?? Color.green
        case .stahl:
            return Color(hex: "#9999A8ff") ?? Color.green
        case .feuer:
            return Color(hex: "#E53B18ff") ?? Color.green
        case .wasser:
            return Color(hex: "#278BCCff") ?? Color.green
        case .pflanze:
            return Color(hex: "#57A950ff") ?? Color.green
        case .elektro:
            return Color(hex: "#E5C600ff") ?? Color.green
        case .psycho:
            return Color(hex: "#E55973ff") ?? Color.green
        case .eis:
            return Color(hex: "#68BAACFF") ?? Color.green
        case .drache:
            return Color(hex: "#4D63ABff") ?? Color.green
        case .unlicht:
            return Color(hex: "#463E3Eff") ?? Color.green
        case .fee:
            return Color(hex: "#EC8EE6FF") ?? Color.green
        case .none:
            return Color(hue: 1.0, saturation: 0.016, brightness: 0.863)
        }
    }
    
    var borderColor: Color {
        return self.color.opacity(0.6)
    }
}

extension Poketype: Identifiable {
    var id: Self {
        self
    }
}
