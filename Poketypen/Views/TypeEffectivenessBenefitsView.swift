//
//  TypeEffectivenessAttack.swift
//  Poketypen
//
//  Created by David Thierbach on 14.04.23.
//

import SwiftUI

struct TypeEffectivenessBenefitsView: View {
    
    @ObservedObject var typeEffectivenessViewModel = TypeEffectivenessModel()
    @State private var pokemonSelection: Poketype?
    
    var body: some View {
        NavigationView {
            VStack {
                SearchbarView(typeEffectivenessViewModel: typeEffectivenessViewModel, twoPossibleTypes: false)
                List(typeEffectivenessViewModel.poketype, id: \.id, selection: $pokemonSelection) { poketype in
                    NavigationLink {
                        TypeEffectBenefitDetail(poketype: poketype)
                    } label: {
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

struct TypeEffectivenessBenefitsView_Previews: PreviewProvider {
    static var previews: some View {
        TypeEffectivenessBenefitsView()
    }
}
