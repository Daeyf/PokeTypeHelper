//
//  FetchingService.swift
//  Poketypen
//
//  Created by David Thierbach on 25.01.23.
//

import Foundation

struct FetchingService {
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
}

struct ServiceError {
    static let invalid = NSError(domain: "Put in Invalid option here", code: 1)
}
