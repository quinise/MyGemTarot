import Foundation
import SwiftUI

struct CupsView: View {
    @State var isCardViewPresented = false
    @Binding var cards: [Card]
    @State var cupsCard: Card
    @Binding var gems: [Gem]
    @Binding var readings: [Reading]
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
                    NavigationLink(destination: ReadingsView(readings: $readings, saveAction: {})) {
                        Image(systemName: "book")
                    }
                }
            }
        }
    }
}

struct CupsView_Previews: PreviewProvider {
    static var previews: some View {
        CupsView(cards: .constant(Card.data), cupsCard: Card.data[0], gems: .constant(Gem.data), readings: .constant(Reading.data))
    }
}
