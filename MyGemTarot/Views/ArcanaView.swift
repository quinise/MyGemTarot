import Foundation
import SwiftUI

struct ArcanaView: View {
    @Binding var cards: [Card]
    @Binding var gems: [Gem]
    @State var isCardViewPresented = false
    @State var arcanaCard: Card
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Text("The Major Arcana is a 22 card set within the tarot that is considered to be the core and the foundation for the deck. All of the deck is filled with archetypal significance, but this is most pronounced within the Major Arcana. These cards follow a storyline that tells of the spiritual travels taken from the innocent wonder of The Fool to the oneness and fulfillment of The World. In other words, these cards tell the story of humanity's spiritual evolution into enlightenment and individuation.")
                ForEach(cards[0..<22], id: \.value_int, content: { card in
                    if card.type == "major" {
                        NavigationLink(destination: CardView(gems: $gems, card: card)) {
                            Text(card.name)
                                .padding()
                        }
                    }
                })
            }
            .padding()
            .navigationTitle("Major Arcana")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                }
                ToolbarItem {
                    NavigationLink(destination: ReadingsView(saveAction: {})) {
                        Image(systemName: "book")
                    }
                }
            }
        }
    }
}

struct ArcanaView_Previews: PreviewProvider {
    static var previews: some View {
        ArcanaView(cards: .constant(Card.data), gems: .constant(Gem.data), arcanaCard: Card.data[0])
    }
}
