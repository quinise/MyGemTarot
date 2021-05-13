//
//  ReadingsView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/5/21.
//

import SwiftUI
import CoreData

struct ReadingsView: View {
    @State var addIsPresented = false
    @State var isReadingViewPresented = false
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode

    @Environment(\.scenePhase) private var scenePhase
    
    let saveAction: () -> Void
    
    @FetchRequest(entity: ReadingCD.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ReadingCD.date, ascending: false)])
    
    var readings: FetchedResults<ReadingCD>
    
    var body: some View {
        List {
            ForEach(readings, id: \.id) { reading in
                //You can force unwrap later once you add the validation code and know it's impossible to be nil
                NavigationLink(destination: ReadingView(reading: reading)) {
                    Text("\(reading.title ?? "")")
                        .padding()
                }
            }
            .onDelete(perform: deleteItems)
        }
        .navigationTitle("Readings")
        .navigationBarItems(trailing:
            NavigationLink(destination: AddView()) {
                Image(systemName: "plus")
            }
        )
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            managedObjectContext.perform {
                offsets.map { readings[$0] }.forEach(managedObjectContext.delete)
                
                do {
                    try managedObjectContext.save()
                } catch {
                    #if DEBUG
                    fatalError()
                    #endif
                }
            }
        }
    }
    
}

struct ReadingsView_Previews: PreviewProvider {
//    @State static var readingData = ReadingData()
//    @State static var reading = ReadingCD()
    static var previews: some View {
        ReadingsView(saveAction: {})
    }
}
