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
    @ObservedObject private var gemData = GemData()
    @ObservedObject private var readingData = ReadingData()
    @State private var reading = Reading.data[0]
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(readingData: readingData, reading: reading, cards: $data.results, gems: $gemData.gems, readings: $readingData.readings)
            }
            .onAppear {
                data.getCards()
                gemData.load()
                readingData.load()
            }
        }
    }
}


