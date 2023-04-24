//
//  RankView.swift
//  Poketypen
//
//  Created by David Thierbach on 03.01.23.
//

import SwiftUI

struct RankView: View {
    @ObservedObject var rankViewModel = RankViewModel()
    
    var body: some View {
        VStack {
            Text("Rang der Typen")
                .font(.title)
                .multilineTextAlignment(.center)
            List {
                Section(header:
                            HStack(alignment: .center) {
                        Text("Typ 1")
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Typ 2")
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("Rank")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    .frame(maxWidth: .infinity)
                    Spacer()
                }) {
                    ForEach(0..<rankViewModel.mixedPokemonCount, id: \.self) {mixedPokemonIndex in
                        
                        PokemonRankItemView(mixedPokemonType:
                                                rankViewModel
                            .mixedPokemon
                            .sorted()
                            .reversed()[mixedPokemonIndex])
                    }
                }
            }
        }
    }
    
}


struct RankView_Previews: PreviewProvider {
    static var previews: some View {
        RankView()
    }
}
