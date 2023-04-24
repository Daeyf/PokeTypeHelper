//
//  SearchBarView.swift
//  Poketypen
//
//  Created by David Thierbach on 23.01.23.
//

import SwiftUI

struct SearchbarView: View {
    @ObservedObject var typeEffectivenessViewModel: TypeEffectivenessModel
    var twoPossibleTypes: Bool
    
    var body: some View {
        
        HStack {
            Text("Suche: ")
                .multilineTextAlignment(.center)
            if twoPossibleTypes {
                SearchbarElementView(typeEffectivenessViewController: typeEffectivenessViewModel,
                                     selection: $typeEffectivenessViewModel.type1Index,
                                     selectedIndex: typeEffectivenessViewModel.type1Index,
                                     poketypeOrder: .first)
                Text("/")
                    .multilineTextAlignment(.center)
                SearchbarElementView(typeEffectivenessViewController: typeEffectivenessViewModel,
                                     selection: $typeEffectivenessViewModel.type2Index,
                                     selectedIndex: typeEffectivenessViewModel.type2Index,
                                     poketypeOrder: .second)
            } else {
                    SearchbarElementView(typeEffectivenessViewController: typeEffectivenessViewModel,
                                         selection: $typeEffectivenessViewModel.type1Index,
                                         selectedIndex: typeEffectivenessViewModel.type1Index,
                                         poketypeOrder: .single)
            }
            
        }
        .padding([.top, .leading, .trailing, .bottom])
        .frame(maxWidth: .infinity)
        .cornerRadius(10)
    }
}

struct Previews_SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarView(typeEffectivenessViewModel: TypeEffectivenessModel(), twoPossibleTypes: true)
        SearchbarView(typeEffectivenessViewModel: TypeEffectivenessModel(), twoPossibleTypes: false)
    }
}
