//
//  TypeEffectivenessViewModel.swift
//  Poketypen
//
//  Created by David Thierbach on 03.01.23.
//

import SwiftUI
import Combine

class TypeEffectivenessModel: PokemonGeneralModel, TypeEffectivenessBase {
    
    @Published var type1Index = 0
    @Published var type2Index = 0
    var allPoketypes: [Poketype] = Poketype.listAllElements
    
    var passThroughModelSubject: PassthroughSubject<[InputType], Error>
    
    var cancellables: Set<AnyCancellable> = []
    
    override init() {
        passThroughModelSubject = PassthroughSubject<[InputType], Error>()
        cancellables = []
        super.init()
        passThroughModelSubject.sink { completion in
            print(completion)
            print("Value not received")
        } receiveValue: { inputList in
            var newMixedPokemonList: [MixedPoketype] = []
            var newPokeList: [Poketype] = []
            
            for input in inputList {
                switch input {
                case .multi(let mixedType):
                    newMixedPokemonList.append(mixedType)
                case .single(let pokeType):
                    newPokeList.append(pokeType)
                }
            }
            print("Value received")
            
            self.mixedPokemon = newMixedPokemonList
            self.poketype = newPokeList
            
        }.store(in: &cancellables)

    }
    
    func filterTypes(for selectedIndex: Int, by order: PoketypeOrder) -> Void {
        switch order {
        case .first: startFetchMulti(with: allPoketypes[selectedIndex], and: allPoketypes[type2Index])
        case .second: startFetchMulti(with: allPoketypes[type1Index], and: allPoketypes[selectedIndex])
        case .single: startFetchSingle(with: allPoketypes[selectedIndex])
        }
    }
    
    /// Fetches the new list of pokemon types
    /// - Parameters:
    ///   - type1: first search item
    ///   - type2: second search item
    func startFetchMulti(with type1: Poketype, and type2: Poketype) {
        /*
         no real fetching needed, but added in case we need this.
         */
        let filteredMixedType = self.filterPokemonList(for: type1.realType, and: type2.realType)
        let inputList = filteredMixedType.compactMap { InputType.multi($0)}
        ProvidingService.fetch(with: inputList) { result in
            switch result {
            case .success(let mixedList):
                print("Send Multi Results: \(inputList)")
                self.passThroughModelSubject.send(mixedList)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func startFetchSingle(with type: Poketype) {
        let inputType = InputType.single(type)
        ProvidingService.fetch(with: [inputType]) { result in
            switch result {
            case .success(let inputList):
                print("Send Single Results: \(inputList)")
                self.passThroughModelSubject.send(inputList)
            case .failure(let error):
                print(error)
            }
        }
    }
}
