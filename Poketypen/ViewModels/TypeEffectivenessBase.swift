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
    
//    override init() {
//        super.init()
//        passThroughModelSubject.sink { completion in
//            print(completion)
//            print("Value not received")
//        } receiveValue: { mixedPokemonList in
//
//            print("Value received")
//            self.mixedPokemon = mixedPokemonList
//
//        }.store(in: &cancellables)
//
//    }
//
//    func filterTypes(for selectedIndex: Int, by order: PoketypeOrder) -> Void {
//        switch order {
//        case .first: startFetchMulti(with: allPoketypes[selectedIndex], and: allPoketypes[type2Index])
//        case .second: startFetchMulti(with: allPoketypes[type1Index], and: allPoketypes[selectedIndex])
//        case .single: print("Cannot search for single PokemonType, only mixedPoketypes available")
//        }
//    }
//
//    /// Fetches the new list of pokemon types
//    /// - Parameters:
//    ///   - type1: first search item
//    ///   - type2: second search item
//    func startFetchMulti(with type1: Poketype, and type2: Poketype) {
//        /*
//         no real fetching needed, but added in case we need this.
//         */
//        let filteredMixedType = self.filterPokemonList(for: type1.realType, and: type2.realType)
//        FetchingService.fetchMulti(with: filteredMixedType) { result in
//            switch result {
//            case .success(let mixedList):
//                self.passThroughModelSubject.send(mixedList)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
}
