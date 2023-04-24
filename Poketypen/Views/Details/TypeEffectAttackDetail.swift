//
//  TypeEffectAttackView.swift
//  Poketypen
//
//  Created by David Thierbach on 24.04.23.
//


import SwiftUI

struct TypeEffectAttackDetail: View {

    var pokeType: Poketype
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Pokemon mit dem Angriff")
            HStack {
                PokemonTypeView(pokemonType: pokeType)
            }
            Text("erhalten folgenden Schaden von Angriffen aus der rechten Spalte")
                .multilineTextAlignment(.center)
            
            ScrollView {
                VStack {
                    AttackDetail(poketype: pokeType, effectivenessType: .strongType)
                    AttackDetail(poketype: pokeType, effectivenessType: .weakType)
                    AttackDetail(poketype: pokeType, effectivenessType: .noDamageType)
                    Divider()
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("Resistenzen")
    }
}

struct TypeEffectAttackDetail_Previews: PreviewProvider {
    static var previews: some View {
        TypeEffectAttackDetail(pokeType: .boden)
    }
}
