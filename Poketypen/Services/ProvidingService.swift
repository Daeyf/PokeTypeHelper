//
//  ProvidingService.swift
//  Poketypen
//
//  Created by David Thierbach on 25.01.23.
//

import Foundation

struct ProvidingService {
    static func fetch(with inputType: [InputType],
                      completion: @escaping (Result<[InputType], Error>) -> Void) {
        DispatchQueue.main.async {
            /*
             Insert Database Fetching if needed
             */
//            let inputList = mixedPokemonType.compactMap { InputType.multi($0) }
            completion(.success(inputType))
        }
    }
    
    /// Counts all types where this type sustains and reduces the count where this type takes at least double damage
    /// - Returns: The calculated resisting vs susceptible types exist for this type of Pokemon
    static func calculateRank(for uuid: UUID,
                              and type1: Poketype,
                              and type2: Poketype?,
                              completion: @escaping (ProvidingResult) -> Void) {
        DispatchQueue.main.async {
            var rankNumber: Int = 0
            
            rankNumber -= DefenseEffectiveness.weakType.loadList(for: type1, and: type2).count
            rankNumber -= DefenseEffectiveness.superWeakType.loadList(for: type1, and: type2).count
            
            rankNumber += DefenseEffectiveness.strongType.loadList(for: type1, and: type2).count
            rankNumber += DefenseEffectiveness.superStrongType.loadList(for: type1, and: type2).count
            rankNumber += DefenseEffectiveness.noDamageType.loadList(for: type1, and: type2).count * 2
            
            completion(.success(uuid, rankNumber))
        }
    }
}

struct ServiceError {
    static let invalid = NSError(domain: "Put in Invalid option here", code: 1)
}

enum ProvidingResult {
    case success(UUID, Int)
    case failure(Error)
}
