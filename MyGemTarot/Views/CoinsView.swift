import Foundation
import SwiftUI

struct CoinsView: View {
    @ObservedObject var readingData: ReadingData
    @Binding var gems: [Gem]
    @Binding var cards: [Card]
    @Binding var readings: [Reading]
    @State var isCardViewPresented = false
    @State var coinsCard: Card
    @State var reading: Reading
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Text("The pentacles is the suit of all things worldly and material. Though we will immediately think of the pentacles as relating to financial matters, we also can understand them as being associated with security, stability, nature, health, and prosperity. The pentacles are of earth element. When we see pentacles show up in a reading, they are usually concerned with your long term future, career, generosity, your household, business investments and your feelings of sensuality. The negative side of the pentacles show up as greed, jealousy, miserliness, and unbridled ambition at the cost of all else.")
                ForEach(cards[50..<64], id: \.value_int, content: { card in
                    if card.suit == "pentacles" {
                        Button(card.name) {
                            coinsCard = card
                            isCardViewPresented = true
                        }
                        .background(Color(UIColor.systemTeal))
                        .font(.system(size:32)) // prefered to title
                        .foregroundColor(.white) // font color
                        .cornerRadius(8)
                        .padding()
                        .fullScreenCover(isPresented: $isCardViewPresented) {
                            CardView(gems: $gems, card: coinsCard)
                        }
                    }
                    
                })
            }
                    .padding()
                    .navigationTitle("Pentacles/Coins")
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

struct CoinsView_Previews: PreviewProvider {
    @State static var readingData = ReadingData()
    @State static var reading = Reading.data[0]
    static var previews: some View {
        CoinsView(readingData: readingData, gems: .constant(Gem.data), cards: .constant(Card.data), readings: .constant(Reading.data), coinsCard: Card.data[0], reading: reading)
    }
}
