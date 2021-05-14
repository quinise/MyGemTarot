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
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(cards: $data.results, gems: .constant(Gem.data))
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .onAppear {
                data.getCards()
                gemData.load()
            }
        }
    }
}


