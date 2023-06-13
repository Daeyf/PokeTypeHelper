//
//  ContentView.swift
//  Poketypen
//
//  Created by David Thierbach on 03.11.22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            TypeEffectivenessDefenseView().tabItem {
                CustomTabItem(imageName: "Schild.SFSymbol", text: "Verteidigung")
            }.tag(0)
            TypeEffectivenessAttackView().tabItem {
                CustomTabItem(imageName: "SchwertSolo.SFSymbol", text: "Angriff Solo")
            }.tag(1)
            TypeEffectivenessBenefitsView().tabItem {
                CustomTabItem(imageName: "Schwert.SFSymbol", text: "Angriff Multi")
            }.tag(2)
            RankView().tabItem {
                CustomTabItem(imageName: "Rank.SFSymbol", text: "Ranking")
            }
            .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
