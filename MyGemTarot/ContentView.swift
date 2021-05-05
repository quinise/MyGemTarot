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
    @Binding public var gems: [Gem]
    @Binding public var readings: [Reading]
    
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
                    ArcanaView(cards: $cards, arcanaCard: cards[0], gems: $gems, readings: $readings)
                }
                
                Button("Cups") {
                    isCupsViewPresented = true
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                .fullScreenCover(isPresented: $isCupsViewPresented) {
                    CupsView(cards: $cards, cupsCard: cards[1], gems: $gems, readings: $readings)
                }
                
                Button("Coins") {
                    isCoinsViewPresented = true
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                .fullScreenCover(isPresented: $isCoinsViewPresented) {
                    CoinsView(gems: $gems, cards: $cards, readings: $readings, coinsCard: cards[1])
                }
                
                Button("Swords") {
                    isSwordsViewPresented = true
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                .fullScreenCover(isPresented: $isSwordsViewPresented) {
                    SwordsView(gems: $gems, cards: $cards, readings: $readings, swordsCard: cards[0])
                }
                
                Button("Wands") {
                    isWandsViewPresented = true
                }
                
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                .fullScreenCover(isPresented: $isWandsViewPresented) {
                    WandsView(gems: $gems, readings: $readings, cards: $cards, wandsCard: cards[1])
                }
            }
            .padding()
            .navigationTitle("My Gem Tarot")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ReadingsView(readings: $readings, saveAction: {})) {
                        Image(systemName: "book")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(cards: .constant(Card.data), gems: .constant(Gem.data), readings: .constant(Reading.data))
        }
    }
}
