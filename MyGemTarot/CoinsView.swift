import Foundation
import SwiftUI

struct CoinsView: View {
    @State var isCardViewPresented = false
    @Binding var cards: [Card]
    @State var coinsCard: Card
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
                    List {
                        ForEach(cards[50..<64
                        ], id: \.value_int, content: { card in
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
                                    CardView(card: coinsCard)
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
                    }
                
        }
    }
}

struct CoinsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsView(cards: .constant(Card.data), coinsCard: Card.data[0])
    }
}
