//
//  RankView.swift
//  Poketypen
//
//  Created by David Thierbach on 03.01.23.
//

import SwiftUI

struct RankView: View {
    
    @StateObject var rankViewController = RankViewController()
    @State private var rankItemSelection: RankItemViewModel?
    
    var body: some View {
        VStack {
            Text("Rang der Typen")
                .font(.title)
                .multilineTextAlignment(.center)
            
            List{
                ForEach
            }
            
            List(rankViewController.rankItemList, id: \.uuid, selection: $rankItemSelection) { rankModelItem in
                HStack {
                    PokemonRankItemView(rankItemViewModel: rankModelItem)
                        .environmentObject(rankViewController)
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
