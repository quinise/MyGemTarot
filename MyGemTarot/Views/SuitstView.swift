//
//  ContentView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import SwiftUI

struct SuitsView: View {
    @ObservedObject var readingData: ReadingData
    @Binding public var cards: [Card]
    @Binding public var gems: [Gem]
    @Binding public var readings: [Reading]
    @State var isArcanaViewPresented = false
    @State var isCupsViewPresented = false
    @State var isCoinsViewPresented = false
    @State var isSwordsViewPresented = false
    @State var isWandsViewPresented = false
    @State var reading: Reading
    
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
                    ArcanaView(readingData: readingData, cards: $cards, gems: $gems, readings: $readings, arcanaCard: cards[0], reading: reading)
                    
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
                    CupsView(readingData: readingData, cards: $cards, gems: $gems, readings: $readings, cupsCard: cards[0], reading: reading)
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
                    CoinsView(readingData: readingData, gems: $gems, cards: $cards, readings: $readings, coinsCard: cards[1], reading: reading)
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
                    SwordsView(readingData: readingData, gems: $gems, cards: $cards, readings: $readings, swordsCard: cards[0], reading: reading)
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
                    WandsView(readingData: readingData,gems: $gems, readings: $readings, cards: $cards, wandsCard: cards[1], reading: reading)
                }
            }
            .padding()
            .navigationTitle("My Gem Tarot")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ReadingsView(readingData: readingData, readings: $readings, reading: reading, chosenReading: reading, saveAction: {})) {
                        Image(systemName: "book")
                    }
                }
            }
        }
    }
}

struct SuitsView_Previews: PreviewProvider {
    @State static var readingData = ReadingData()
    @State static var reading = Reading.data[0]
    static var previews: some View {
        NavigationView {
            SuitsView(readingData: readingData, cards: .constant(Card.data), gems: .constant(Gem.data), readings: .constant(Reading.data), reading: reading)
        }
    }
}
