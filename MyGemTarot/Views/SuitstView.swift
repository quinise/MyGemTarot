//
//  ContentView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import SwiftUI

struct SuitsView: View {
    @Binding public var cards: [Card]
    @Binding public var gems: [Gem]
    @State var isArcanaViewPresented = false
    @State var isCupsViewPresented = false
    @State var isCoinsViewPresented = false
    @State var isSwordsViewPresented = false
    @State var isWandsViewPresented = false
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                ContentView()
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
                    ArcanaView(cards: $cards, gems: $gems, arcanaCard: CardsObjectController.shared.results[0])
                    
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
                    CupsView(cards: $cards, gems: $gems, cupsCard: cards[0])
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
                    CoinsView(cards: $cards, gems: $gems, coinsCard: CardsObjectController.shared.results[0])
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
                    SwordsView(cards: $cards, gems: $gems, swordsCard: CardsObjectController.shared.results[0])
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
                    WandsView(cards: $cards, gems: $gems, wandsCard: CardsObjectController.shared.results[0])
                }
            }
            .padding()
            .navigationTitle("My Gem Tarot")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ReadingsView(saveAction: {})) {
                        Image(systemName: "book")
                    }
                }
            }
        }
    }
}

struct SuitsView_Previews: PreviewProvider {
//    @State static var reading = ReadingCD()
    static var previews: some View {
        NavigationView {
            SuitsView(cards: .constant(Card.data), gems: .constant(Gem.data))
        }
    }
}
