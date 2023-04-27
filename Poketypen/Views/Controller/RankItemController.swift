//
//  RankItemController.swift
//  Poketypen
//
//  Created by David Thierbach on 26.04.23.
//
import SwiftUI
import Combine

class RankItemController: ObservableObject {
    
    @Published var rankItem: RankItemViewModel
    
    var passThroughModelSubject: PassthroughSubject<InputType, Error>
    var cancellables: Set<AnyCancellable> = []
    
    init(rankItem: RankItemViewModel) {
        self.rankItem = rankItem
        passThroughModelSubject = PassthroughSubject<InputType, Error>()
        
        let uuid = UUID()
        let rankItem = RankItemViewModel(uuid: uuid, mixedPokemon: rankItem.mixedPokemon)
            
        self.calculateRank(for: uuid, pokeType1: rankItem.mixedPokemon.type1, poketype2: rankItem.mixedPokemon.type2 ?? Poketype.none)
        
        passThroughModelSubject.sink { completion in
            print(completion)
            print("Value not received")
        } receiveValue: { inputType in
            switch inputType {
            case .rankContent(let uuidToFind, let rank):
                if rankItem.uuid == uuidToFind {
                    print("input incoming: \(rank) for uuid: \(uuidToFind)")
                    self.rankItem.rank = rank
                    
                }
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
}
