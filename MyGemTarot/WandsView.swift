import Foundation
import SwiftUI

struct WandsView: View {
    @State var isCardViewPresented = false
    @Binding var gems: [Gem]
    @Binding var readings: [Reading]
    @Binding var cards: [Card]
    @State var wandsCard: Card
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Text("Associated with the element of fire, the suit of wands represents passion, inspiration and willpower. The wands imbue their users with primal energy, for it is through them that the cycle of creation can begin. Because of their ability to bring energy into any situation, they are also associated with action, ambition and making plans. At their worst, they can refer to situations that are filled with recklessness and lack of direction. As you follow the journey within the wands, you'll come across these themes again and again.")
                ForEach(cards[22..<36], id: \.value_int, content: { card in
                    if card.suit == "wands" {
                        Button(card.name) {
                            wandsCard = card
                            isCardViewPresented = true
                        }
                        .background(Color(UIColor.systemTeal))
                        .font(.system(size:32)) // prefered to title
                        .foregroundColor(.white) // font color
                        .cornerRadius(8)
                        .padding()
                        .fullScreenCover(isPresented: $isCardViewPresented) {
                            CardView(gems: $gems, card: wandsCard)
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
                            NavigationLink(destination: ReadingsView(readings: $readings, saveAction: {})) {
                                Image(systemName: "book")
                            }
                        }
                    }
                
        }
    }
}

struct WandsView_Previews: PreviewProvider {
    static var previews: some View {
        WandsView(gems: .constant(Gem.data), readings: .constant(Reading.data), cards: .constant(Card.data), wandsCard: Card.data[0])
    }
}
