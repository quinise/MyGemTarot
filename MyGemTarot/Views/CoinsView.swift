import Foundation
import SwiftUI

struct CoinsView: View {
    @Binding var cards: [Card]
    @Binding var gems: [Gem]
    @State var isCardViewPresented = false
    @State var coinsCard: Card
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Text("The pentacles is the suit of all things worldly and material. Though we will immediately think of the pentacles as relating to financial matters, we also can understand them as being associated with security, stability, nature, health, and prosperity. The pentacles are of earth element. When we see pentacles show up in a reading, they are usually concerned with your long term future, career, generosity, your household, business investments and your feelings of sensuality. The negative side of the pentacles show up as greed, jealousy, miserliness, and unbridled ambition at the cost of all else.")
                ForEach(cards[50..<64], id: \.value_int, content: { card in
                    if card.suit == "pentacles" {
                        NavigationLink(destination: CardView(gems: $gems, card: card)) {
                            Text(card.name)
                                .padding()
                        }
                    }
                    
                })
            }
                    .padding()
                    .navigationTitle("Pentacles/Coins")
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

struct CoinsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsView(cards: .constant(Card.data), gems: .constant(Gem.data), coinsCard: Card.data[0])
    }
}
