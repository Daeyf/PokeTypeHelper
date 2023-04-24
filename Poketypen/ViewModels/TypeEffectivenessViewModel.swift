//
//  TypeEffectivenessViewModel.swift
//  Poketypen
//
//  Created by David Thierbach on 03.01.23.
//

import SwiftUI
import Combine

class TypeEffectivenessViewController: MixedPokemonViewModel, ObservableObject {
    @Published var type1Index = 0
    @Published var type2Index = 0
    static let allPoketypes = Poketype.listAllElements
    
    let passThroughModelSubject = PassthroughSubject<[MixedPoketype], Error>()
    
    private var cancellables: Set<AnyCancellable> = []
    
    override init() {
        super.init()
        passThroughModelSubject.sink { completion in
            print(completion)
            print("Value not received")
        } receiveValue: { mixedPokemonList in
            
            print("Value received")
            self.mixedPokemon = mixedPokemonList
            
        }.store(in: &cancellables)
    }
    
    func filterTypes(by type: Poketype) -> Void {
        startFetch(with: type)
    }
    
    func startFetch(with type: Poketype) {
        let filteredMixedTypetype = self.filterPokemonList(for: type)
        FetchingService.fetch(with: filteredMixedTypetype) { result in
            switch result {
            case .success(let mixedList):
                self.passThroughModelSubject.send(mixedList)
            case .failure(let error):
                print(error)
            }
        }
    }
}
