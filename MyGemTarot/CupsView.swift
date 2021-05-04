import SwiftUI

struct CupsView: View {
    @State var isCardViewPresented = false
    @Binding var cards: [Card]
    @State var cupsCard: Card
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
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
                            CardView(card: cupsCard)
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
            }
        }
}
}

struct CupsView_Previews: PreviewProvider {
    static var previews: some View {
        CupsView(cards: .constant(Card.data), cupsCard: Card.data[0])
    }
}
