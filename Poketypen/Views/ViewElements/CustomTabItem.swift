//
//  CustomTabItem.swift
//  Poketypen
//
//  Created by David Thierbach on 13.04.23.
//

import SwiftUI

struct CustomTabItem: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .renderingMode(.template)
                .resizable()
            Text(text)
        }
    }
}

struct CustomTabItem_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabItem(imageName: "Schild.SFSymbol", text: "Schild")
    }
}





