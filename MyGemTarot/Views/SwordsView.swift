import Foundation
import SwiftUI

struct SwordsView: View {
    @Binding var cards: [Card]
    @Binding var gems: [Gem]
    @State var isCardViewPresented = false
    @State var swordsCard: Card
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Text("The swords is the suit of intelligence, logic, truth, ambition, conflict and communication. It is associated with the element of air. In readings, these cards focus on the faculty and power of intellect, which like the swords themselves, are double-edged. This can be used for both good or evil, to help and to harm, and our greatest conflicts usually come from this delicate balance. At their worst, the swords can be abusive, harsh, and lack empathy.")
                ForEach(cards[64..<78], id: \.value_int, content: { card in
                    if card.suit == "swords" {
                        NavigationLink(destination: CardView(gems: $gems, card: card)) {
                            Text(card.name)
                                .padding()
                        }
                    }
                    
                })
            }
                    .padding()
                    .navigationTitle("Swords")
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

struct SwordsView_Previews: PreviewProvider {
    static var previews: some View {
        SwordsView(cards: .constant(Card.data), gems: .constant(Gem.data), swordsCard: Card.data[0])
    }
}
