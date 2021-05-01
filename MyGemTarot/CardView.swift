//
//  CardView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack {
            Text("name")
            Text("description")
            Text("meaning up")
            Text("meaning down")
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    // pass in card data
    static var previews: some View {
        CardView()
    }
}
