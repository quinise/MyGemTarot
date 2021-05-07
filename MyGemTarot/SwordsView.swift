import Foundation
import SwiftUI

struct SwordsView: View {
    @ObservedObject var readingData: ReadingData
    @State var isCardViewPresented = false
    @Binding var gems: [Gem]
    @Binding var cards: [Card]
    @Binding var readings: [Reading]
    @State var swordsCard: Card
    @State var reading: Reading
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Text("The swords is the suit of intelligence, logic, truth, ambition, conflict and communication. It is associated with the element of air. In readings, these cards focus on the faculty and power of intellect, which like the swords themselves, are double-edged. This can be used for both good or evil, to help and to harm, and our greatest conflicts usually come from this delicate balance. At their worst, the swords can be abusive, harsh, and lack empathy.")
                ForEach(cards[64..<78], id: \.value_int, content: { card in
                    if card.suit == "swords" {
                        Button(card.name) {
                            swordsCard = card
                            isCardViewPresented = true
                        }
                        .background(Color(UIColor.systemTeal))
                        .font(.system(size:32)) // prefered to title
                        .foregroundColor(.white) // font color
                        .cornerRadius(8)
                        .padding()
                        .fullScreenCover(isPresented: $isCardViewPresented) {
                            CardView(gems: $gems, card: swordsCard)
                        }
                    }
                    
                })
            }
                    .padding()
                    .navigationTitle("Swords")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "arrow.left")
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: ReadingsView(readingData: readingData, readings: $readings, reading: reading, chosenReading: reading, saveAction: {})) {
                                Image(systemName: "book")
                            }
                        }
                    }
                
        }
    }
}

struct SwordsView_Previews: PreviewProvider {
    @State static var readingData = ReadingData()
    @State static var reading = Reading.data[0]
    static var previews: some View {
        SwordsView(readingData: readingData, gems: .constant(Gem.data), cards: .constant(Card.data), readings: .constant(Reading.data), swordsCard: Card.data[0], reading: reading)
    }
}
