//
//  ContentView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import SwiftUI

struct ContentView: View {
    @State var isArcanaViewPresented = false
    @State var isCupsViewPresented = false
    @State var isCoinsViewPresented = false
    @State var isSwordsViewPresented = false
    @State var isWandsViewPresented = false
    
    @Binding public var cards: [Card]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                Button("Major Arcana") {
                    isArcanaViewPresented = true
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                .fullScreenCover(isPresented: $isArcanaViewPresented) {
                    // provide type == "major" cards
                    ArcanaView(cards: $cards, arcanaCard: cards[1])
                }
                
                Button("Cups") {
                    isCupsViewPresented = true
                }
                .fullScreenCover(isPresented: $isCupsViewPresented) {
                    CupsView(cards: $cards, cupsCard: cards[1])
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                
                Button("Coins") {
                    isCoinsViewPresented = true
                }
                .fullScreenCover(isPresented: $isCoinsViewPresented) {
                    CoinsView(cards: $cards, coinsCard: cards[1])
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                
                Button("Swords") {
                    isSwordsViewPresented = true
                }
                .fullScreenCover(isPresented: $isSwordsViewPresented) {
                    SwordsView(cards: $cards, swordsCard: cards[1])
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                
                Button("Wands") {
                    isWandsViewPresented = true
                }
                .fullScreenCover(isPresented: $isWandsViewPresented) {
                    WandsView(cards: $cards, wandsCard: cards[1])
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                
            }
            .padding()
            .navigationTitle("My Gem Tarot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(cards: .constant(Card.data))
        }
    }
}
