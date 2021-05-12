import Foundation
import SwiftUI

struct WandsView: View {
    @Binding var cards: [Card]
    @Binding var gems: [Gem]
    @State var isCardViewPresented = false
    @State var wandsCard: Card
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Text("Associated with the element of fire, the suit of wands represents passion, inspiration and willpower. The wands imbue their users with primal energy, for it is through them that the cycle of creation can begin. Because of their ability to bring energy into any situation, they are also associated with action, ambition and making plans. At their worst, they can refer to situations that are filled with recklessness and lack of direction. As you follow the journey within the wands, you'll come across these themes again and again.")
                ForEach(cards[22..<36], id: \.value_int, content: { card in
                    if card.suit == "wands" {
                        NavigationLink(destination: CardView(gems: $gems, card: card)) {
                            Text(card.name)
                                .padding()
                        }
                    }
                    
                })
            }
                    .padding()
                    .navigationTitle("Wands")
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

struct WandsView_Previews: PreviewProvider {
    static var previews: some View {
        WandsView(cards: .constant(Card.data), gems: .constant(Gem.data), wandsCard: Card.data[0])
    }
}
