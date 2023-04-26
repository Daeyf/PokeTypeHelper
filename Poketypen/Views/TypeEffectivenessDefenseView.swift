//
//  TypeEffectiveness.swift
//  Poketypen
//
//  Created by David Thierbach on 03.01.23.
//

import SwiftUI

struct TypeEffectivenessDefenseView: View {
    
    @ObservedObject var typeEffectivenessDefenseViewModel = TypeEffectivenessController()
    @State private var mixedPokemonSelection: MixedPoketype?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                SearchbarView(typeEffectivenessViewModel: typeEffectivenessDefenseViewModel, twoPossibleTypes: true)
                List(typeEffectivenessDefenseViewModel.mixedPokemon, id: \.id, selection: $mixedPokemonSelection) { mixedPokemon in
                    NavigationLink {
                        TypeEffectDefenseDetail(mixedPokemon: mixedPokemon)
                    } label: {
                        HStack {
                            PokemonTypeView(pokemonType: mixedPokemon.type1)
                            PokemonTypeView(pokemonType: mixedPokemon.type2)
                            VStack {
                                Text("Resistenzen: \(mixedPokemon.resistAgainst.count)")
                                    .font(.caption2)
                                    .fontWeight(.thin)
                                    .multilineTextAlignment(.leading)
                                Text("Schwächen: \(mixedPokemon.weakAgainst.count)")
                                    .font(.caption2)
                                    .fontWeight(.thin)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Effektivität der Verteidigung"), displayMode: .inline)
        }
    }
}

struct TypeEffectivenessDefenseView_Previews: PreviewProvider {
    static var previews: some View {
        TypeEffectivenessDefenseView()
    }
}
