//
//  WandsView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import SwiftUI

struct ArcanaView: View {
    @State var isCardViewPresented = false
    
    @Binding var cards: [Card]
    @State var arcanaCard: Card
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.defaultMinListRowHeight) var minRowHeight

    var body: some View {
        NavigationView {
                    List {
                        ForEach(cards, id: \.value_int, content: { card in
                            if card.type == "major" {
                                Button(card.name) {
                                    arcanaCard = card
                                    isCardViewPresented = true
                                }
                                .background(Color(UIColor.systemTeal))
                                .font(.system(size:32)) // prefered to title
                                .foregroundColor(.white) // font color
                                .cornerRadius(8)
                                .padding()
                                .fullScreenCover(isPresented: $isCardViewPresented) {
//                                    $arcanaCard = card
                                    CardView(card: arcanaCard)
                                }
//                                Text(card.name)
//                                Text(card.desc)
//                                    .foregroundColor(.primary)
//                                    Spacer()
                            }
                            
                        })
                    }
            .padding()
            .navigationTitle("Major Arcana")
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

struct ArcanaView_Previews: PreviewProvider {
    static var previews: some View {
        ArcanaView(cards: .constant(Card.data), arcanaCard: Card.data[0])
    }
}
