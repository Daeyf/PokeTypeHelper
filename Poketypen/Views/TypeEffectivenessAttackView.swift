//
//  TypeEffectivenessAttackView.swift
//  Poketypen
//
//  Created by David Thierbach on 24.04.23.
//

import SwiftUI

struct TypeEffectivenessAttackView: View {
    
    @ObservedObject var typeEffectivenessViewModel = TypeEffectivenessModel()
    @State private var pokemonSelection: Poketype?
    
    var body: some View {
        NavigationView {
            VStack {
                SearchbarView(typeEffectivenessViewModel: typeEffectivenessViewModel, twoPossibleTypes: false)
                List(typeEffectivenessViewModel.poketype, id: \.id, selection: $pokemonSelection) { poketype in
                    NavigationLink {
                        TypeEffectAttackDetail(pokeType: poketype)
                    } label: {
                        //Test
                        HStack {
                            PokemonTypeView(pokemonType: poketype)
                            VStack {
                                Text("Resistenzen: \(poketype.weakAgainst.count)")
                                    .font(.caption2)
                                    .fontWeight(.thin)
                                    .multilineTextAlignment(.leading)
                                Text("Schwächen: \(poketype.resistAgainst.count)")
                                    .font(.caption2)
                                    .fontWeight(.thin)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Angriffsauswirkung"), displayMode: .inline)
        }
    }
}

struct TypeEffectivenessAttackView_Previews: PreviewProvider {
    static var previews: some View {
        TypeEffectivenessAttackView()
    }
}
