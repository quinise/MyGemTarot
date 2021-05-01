//
//  WandsView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import SwiftUI

struct ArcanaView: View {
    @ObservedObject var cardsObjectController = CardsObjectController.shared
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(cardsObjectController.results, id: \.value_int, content: {
                        card in
                        Text(card.desc)
                    })
                }.onAppear() {
                    cardsObjectController.GETCards()
                }
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

struct WandsView_Previews: PreviewProvider {
    static var previews: some View {
        WandsView()
    }
}
}
