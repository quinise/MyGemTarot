import Foundation
import SwiftUI

struct CupsView: View {
    @Binding var cards: [Card]
    @Binding var gems: [Gem]
    @State var isCardViewPresented = false
    @State var cupsCard: Card
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Text("The suit of cups rules over all that is associated with emotions, the unconscious, creativity, and intuition. They frequently talk about relationships, whether romantic or otherwise, and one's imagination and inner world. They are associated with the element of water, which becomes a frequent visual theme within this suit. At their worst, the cups suit is fret with uncontrolled feelings, fantasy, and a disconnect with one's inner voice.")
                ForEach(cards[36..<50], id: \.value_int, content: { card in
                    if card.suit == "cups" {
                        NavigationLink(destination: CardView(gems: $gems, card: card)) {
                            Text(card.name)
                                .padding()
                        }
                    }
                })
            }
            .padding()
            .navigationTitle("Cups")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ReadingsView(saveAction: {})) {
                        Image(systemName: "book")
                    }
                }
            }
        }
    }
}

struct CupsView_Previews: PreviewProvider {
    static var previews: some View {
        CupsView(cards: .constant(Card.data), gems: .constant(Gem.data), cupsCard: Card.data[0])
    }
}
