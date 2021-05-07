import Foundation
import SwiftUI

struct ArcanaView: View {
    @ObservedObject var readingData: ReadingData
    @State var isCardViewPresented = false
    @Binding var cards: [Card]
    @State var arcanaCard: Card
    @State var reading: Reading
    @Binding var gems: [Gem]
    @Binding var readings: [Reading]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Text("The Major Arcana is a 22 card set within the tarot that is considered to be the core and the foundation for the deck. All of the deck is filled with archetypal significance, but this is most pronounced within the Major Arcana. These cards follow a storyline that tells of the spiritual travels taken from the innocent wonder of The Fool to the oneness and fulfillment of The World. In other words, these cards tell the story of humanity's spiritual evolution into enlightenment and individuation.")
                ForEach(cards[0..<22], id: \.value_int, content: { card in
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
                            CardView(gems: $gems, card: arcanaCard)
                        }
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
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ReadingsView(readingData: readingData, readings: $readings, reading: reading, chosenReading: reading, saveAction: {})) {
                        Image(systemName: "book")
                    }
                }
            }
        
        }
    }
}

struct ArcanaView_Previews: PreviewProvider {
    @State static var readingData = ReadingData()
    @State static var reading = Reading.data[0]
    static var previews: some View {
        ArcanaView(readingData: readingData, cards: .constant(Card.data), arcanaCard: Card.data[0], reading: reading, gems: .constant(Gem.data), readings: .constant(Reading.data))
    }
}
