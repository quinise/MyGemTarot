import Foundation
import SwiftUI

struct ArcanaView: View {
    @State var isCardViewPresented = false
    
    @Binding var cards: [Card]
    @State var arcanaCard: Card
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
                    List {
                        ForEach(cards[0..<22], id: \.value_int, content: { card in
                            if card.type == "major" {
                                Button(card.name) {
                                    arcanaCard = card
                                    isCardViewPresented = true
                                }
                                .background(Color(UIColor.systemTeal))
                                .font(.system(size:32)) // prefered to title
                                .foregroundColor(.white) // font color
                                .cornerRadius(8)
                                .padding()
                                .fullScreenCover(isPresented: $isCardViewPresented) {
                                    CardView(card: arcanaCard)
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

struct ArcanaView_Previews: PreviewProvider {
    static var previews: some View {
        ArcanaView(cards: .constant(Card.data), arcanaCard: Card.data[0])
    }
}
