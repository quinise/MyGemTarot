import Foundation
import SwiftUI

struct WandsView: View {
    @State var isCardViewPresented = false
    
    @Binding var cards: [Card]
    @State var wandsCard: Card
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
                    List {
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
                                    CardView(card: wandsCard)
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
                    }
                
        }
    }
}

struct WandsView_Previews: PreviewProvider {
    static var previews: some View {
        WandsView(cards: .constant(Card.data), wandsCard: Card.data[0])
    }
}
