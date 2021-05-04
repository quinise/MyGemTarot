//
//  CardView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import SwiftUI

struct CardView: View {
//    @Binding var cards: [Card]
    let card: Card
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 12) {
                    Text("Description").font(.title)
                    Text(card.desc)
                    Text("Upright Meaning").font(.title)
                    Text(card.meaning_up)
                    Text("Reversed Meaning").font(.title)
                    Text(card.meaning_rev)
            }
            .padding()
            .navigationTitle(card.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                    
                    }
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    // pass in card data
    static var card = Card.data[0]
    static var previews: some View {
        CardView(card: card)
    }
}
