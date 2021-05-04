import Foundation
import SwiftUI

struct SwordsView: View {
    @State var isCardViewPresented = false
    
    @Binding var cards: [Card]
    @State var swordsCard: Card
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
                    List {
                        ForEach(cards[64..<78], id: \.value_int, content: { card in
                            if card.suit == "swords" {
                                Button(card.name) {
                                    swordsCard = card
                                    isCardViewPresented = true
                                }
                                .background(Color(UIColor.systemTeal))
                                .font(.system(size:32)) // prefered to title
                                .foregroundColor(.white) // font color
                                .cornerRadius(8)
                                .padding()
                                .fullScreenCover(isPresented: $isCardViewPresented) {
                                    CardView(card: swordsCard)
                                }
                            }
                            
                        })
                    }
                    .padding()
                    .navigationTitle("Swords")
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

struct SwordsView_Previews: PreviewProvider {
    static var previews: some View {
        SwordsView(cards: .constant(Card.data), swordsCard: Card.data[0])
    }
}
