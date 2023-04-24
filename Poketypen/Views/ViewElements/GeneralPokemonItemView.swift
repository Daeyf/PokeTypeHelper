//
//  PokemonItemView.swift
//  Poketypen
//
//  Created by David Thierbach on 04.01.23.
//

import SwiftUI

struct GeneralPokemonItemView: View {
    
    let mixedPokemonType: MixedPoketype
    let stackingAlignment: StackingAlignment
    
    var body: some View {
        switch stackingAlignment {
        case .horizontal:
            
            HStack(alignment: .center) {
                
                PokemonTypeView(pokemonType: mixedPokemonType.type1)
                    .multilineTextAlignment(.leading)
                
                if mixedPokemonType.type2 != nil {
                    Text("/")
                    
                    PokemonTypeView(pokemonType: mixedPokemonType.type2)
                        .multilineTextAlignment(.leading)
                }
            }
        case .vertical:
            
            VStack(alignment: .center) {
                
                PokemonTypeView(pokemonType: mixedPokemonType.type1)
                    .multilineTextAlignment(.leading)
                
                if mixedPokemonType.type2 != nil {
                    Divider()
                    
                    PokemonTypeView(pokemonType: mixedPokemonType.type2)
                        .multilineTextAlignment(.leading)
                }
            }
        }
        
    }
}

struct GeneralPokemonItemView_Previews: PreviewProvider {
    static var previews: some View {
        let mockPokemonType = MixedPoketype(type1: Poketype.normal, type2: Poketype.feuer, rank: 0)
        let mockPokemonType2 = MixedPoketype(type1: Poketype.normal, rank: 9)
        VStack {
            PokemonRankItemView(mixedPokemonType: mockPokemonType)
            PokemonRankItemView(mixedPokemonType: mockPokemonType2)
        }
    }
}
