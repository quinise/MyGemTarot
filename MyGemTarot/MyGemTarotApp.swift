//
//  MyGemTarotApp.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import SwiftUI

@main
struct MyGemTarotApp: App {
    @ObservedObject private var data = CardsObjectController()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(cards: $data.results)
            }.onAppear() {
                data.getCards()
            }
        }
    }
}
