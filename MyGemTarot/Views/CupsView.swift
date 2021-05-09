import Foundation
import SwiftUI

struct CupsView: View {
    @ObservedObject var readingData: ReadingData
    @Binding var cards: [Card]
    @Binding var gems: [Gem]
    @Binding var readings: [Reading]
    @State var isCardViewPresented = false
    @State var cupsCard: Card
    @State var reading: Reading
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Text("The suit of cups rules over all that is associated with emotions, the unconscious, creativity, and intuition. They frequently talk about relationships, whether romantic or otherwise, and one's imagination and inner world. They are associated with the element of water, which becomes a frequent visual theme within this suit. At their worst, the cups suit is fret with uncontrolled feelings, fantasy, and a disconnect with one's inner voice.")
                ForEach(cards[36..<50], id: \.value_int, content: { card in
                    if card.suit == "cups" {
                        Button(card.name) {
                            cupsCard = card
                            isCardViewPresented = true
                        }
                        .background(Color(UIColor.systemTeal))
                        .font(.system(size:32)) // prefered to title
                        .foregroundColor(.white) // font color
                        .cornerRadius(8)
                        .padding()
                        .fullScreenCover(isPresented: $isCardViewPresented) {
                            CardView(gems: $gems, card: cupsCard)
                        }
                    }
                })
            }
            .padding()
            .navigationTitle("Cups")
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

struct CupsView_Previews: PreviewProvider {
    @State static var readingData = ReadingData()
    @State static var reading = Reading.data[0]
    static var previews: some View {
        CupsView(readingData: readingData, cards: .constant(Card.data), gems: .constant(Gem.data), readings: .constant(Reading.data), cupsCard: Card.data[0], reading: reading)
    }
}
