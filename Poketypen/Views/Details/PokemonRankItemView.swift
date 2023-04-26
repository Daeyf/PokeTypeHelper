//
//  PokemonTypeRow.swift
//  Poketypen
//
//  Created by David Thierbach on 02.01.23.
//

import SwiftUI

struct PokemonRankItemView: View {
    
    @ObservedObject var rankViewController: RankItemController
    
    init(rankItemViewModel: RankItemViewModel) {
        rankViewController = RankItemController(rankItem: rankItemViewModel)
    }
    
    var body: some View {
        
        HStack(alignment: .center) {
            GeometryReader { metrics in
                HStack(alignment: .center) {
                    GeneralPokemonItemView(mixedPokemonType: rankViewController.rankItem.mixedPokemon, stackingAlignment: .horizontal)
                }
                .frame(width: metrics.size.width * 0.8)
                
                if let rank = rankViewController.rankItem.rank {
                    Text("\(rank)")
                        .frame(width: metrics.size.width * 0.2)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                } else {
                    Image(systemName: "rays")
                        .frame(width: metrics.size.width * 0.2)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct PokemonRankItemView_Previews: PreviewProvider {
    static var previews: some View {
        let mockPokemonType = MixedPoketype(type1: Poketype.normal, type2: Poketype.feuer)
        let mockPokemonType2 = MixedPoketype(type1: Poketype.normal)
        let mockRankItemViewModel = RankItemViewModel(uuid: UUID(), mixedPokemon: mockPokemonType)
        let mockRankItemViewModel2 = RankItemViewModel(uuid: UUID(), mixedPokemon: mockPokemonType2)
        VStack {
            PokemonRankItemView(rankItemViewModel: mockRankItemViewModel)
            PokemonRankItemView(rankItemViewModel: mockRankItemViewModel2)
        }
    }
}
