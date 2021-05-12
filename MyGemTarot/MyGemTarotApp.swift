//
//  MyGemTarotApp.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import SwiftUI
import CoreData

@main
struct MyGemTarotApp: App {
    @ObservedObject private var data = CardsObjectController.shared
    @ObservedObject private var gemData = GemData()
//    @ObservedObject private var readingData = ReadingData()
//    @State private var reading = Reading.data[0]
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SuitsView(cards: $data.results, gems: .constant(Gem.data))
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .onAppear {
                data.getCards()
                gemData.load()
//                readingData.load()
            }
        }
    }
}


