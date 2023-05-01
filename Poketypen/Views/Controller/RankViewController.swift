//
//  Pokeliste.swift
//  Poketypen
//
//  Created by David Thierbach on 04.11.22.
//

import SwiftUI
import Combine

class RankViewController: PokemonGeneralModel, ObservableObject {
    
    @Published var rankItemList: [RankItemViewModel] = []
    
    var passThroughModelSubject: PassthroughSubject<InputType, Error>
    var cancellables: Set<AnyCancellable> = []
    
    override init() {
        passThroughModelSubject = PassthroughSubject<InputType, Error>()
        super.init()
        
        for mixedPokemon in self.mixedPokemon {
            let uuid = UUID()
            let rankItem = RankItemViewModel(uuid: uuid, mixedPokemon: mixedPokemon)
            rankItemList.append(rankItem)
            self.calculateRank(for: uuid, pokeType1: mixedPokemon.type1, poketype2: mixedPokemon.type2 ?? .none)
        }
        
        passThroughModelSubject.sink { completion in
            print(completion)
            print("Value not received")
        } receiveValue: { inputType in
            switch inputType {
            case .rankContent(let uuidToFind, let rank):
                self.addRank(to: &self.rankItemList, for: uuidToFind, with: rank)
                
            default: print("the other options belong to another inputtype")
            }
            
        }.store(in: &cancellables)
    }
    
    private func calculateRank(for uuid: UUID, pokeType1: Poketype, poketype2: Poketype) {
        ProvidingService.calculateRank(for: uuid, and: pokeType1, and: poketype2) { result in
            switch result {
            case .success(let uuid, let rank):
                print("input incoming: \(rank)")
                let input = InputType.rankContent(uuid, rank)
                self.passThroughModelSubject.send(input)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func addRank(to rankItemList: inout [RankItemViewModel], for uuid: UUID, with rank: Int) {
        guard let index = self.rankItemList.firstIndex(where: { $0.uuid == uuid }) else {
            print("Cannot find element with uuid: \(uuid)")
            return
        }
        self.rankItemList[index].rank = rank
    }
}
