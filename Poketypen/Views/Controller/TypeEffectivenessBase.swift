//
//  TypeEffectivenessBase.swift
//  Poketypen
//
//  Created by David Thierbach on 19.04.23.
//

import Foundation
import SwiftUI
import Combine

protocol TypeEffectivenessBase: ObservableObject {
    
    var allPoketypes: [Poketype] { get set }
    var passThroughModelSubject: PassthroughSubject<[InputType], Error> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    
    func filterTypes(for selectedIndex: Int, by order: PoketypeOrder) -> Void 
}
