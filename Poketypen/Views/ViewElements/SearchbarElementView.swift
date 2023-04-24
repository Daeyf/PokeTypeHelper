//
//  SearchbarElement.swift
//  Poketypen
//
//  Created by David Thierbach on 26.01.23.
//

import SwiftUI

struct SearchbarElementView: View {
    
    @ObservedObject var typeEffectivenessViewController: TypeEffectivenessModel
    var selection: Binding<Int>
    var selectedIndex: Int
    let poketypeOrder: PoketypeOrder
    
    var body: some View {
        Menu {
            Picker(selection: selection,
                   label: EmptyView(),
                   content: {
                
                ForEach(0..<typeEffectivenessViewController.allPoketypes.count, id: \.self) { index in
                    PokemonTypeView(pokemonType: typeEffectivenessViewController.allPoketypes[index])
                }
            })
            .pickerStyle(.inline)
            .onChange(of: selectedIndex, perform: { newTypeIndex in
                typeEffectivenessViewController.filterTypes(for: newTypeIndex, by: poketypeOrder)
            })
        } label: {
            if selectedIndex == 0 {
                PokemonTypeView(pokemonType: nil, noNameText: poketypeOrder.orderText)
            } else {
                PokemonTypeView(pokemonType: typeEffectivenessViewController.allPoketypes[selectedIndex])
            }
        }
        .padding(.horizontal, 5.0)
        .frame(maxWidth: .infinity)
    }
}

struct Previews_SearchBarElementView_Previews: PreviewProvider {
    static var previews: some View {
        let typeEffectivenessViewController = TypeEffectivenessModel()
        VStack {
            SearchbarElementView(typeEffectivenessViewController: typeEffectivenessViewController, selection: .constant(0), selectedIndex: 0, poketypeOrder: .first)
            SearchbarElementView(typeEffectivenessViewController: typeEffectivenessViewController, selection: .constant(3), selectedIndex: 3, poketypeOrder: .first)
            SearchbarElementView(typeEffectivenessViewController: typeEffectivenessViewController, selection: .constant(0), selectedIndex: 0, poketypeOrder: .second)
            SearchbarElementView(typeEffectivenessViewController: typeEffectivenessViewController, selection: .constant(0), selectedIndex: 0, poketypeOrder: .single)
        }
    }
}

