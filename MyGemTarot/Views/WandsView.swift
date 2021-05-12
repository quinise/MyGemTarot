import Foundation
import SwiftUI

struct WandsView: View {
//    @ObservedObject var readingData: ReadingData
    @Binding var cards: [Card]
    @Binding var gems: [Gem]
//    @Binding var readings: [Reading]
    @State var isCardViewPresented = false
    @State var wandsCard: Card
//    @State var reading: ReadingCD
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
                            NavigationLink(destination: ReadingsView(saveAction: {})) {
                                Image(systemName: "book")
                            }
                        }
                    }
                
        }
    }
}

struct WandsView_Previews: PreviewProvider {
//    @State static var readingData = ReadingData()
//    @State static var reading = Reading.data[0]
//    @State static var reading = ReadingCD()
    static var previews: some View {
        WandsView(cards: .constant(Card.data), gems: .constant(Gem.data), wandsCard: Card.data[0])
    }
}
