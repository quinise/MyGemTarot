//
//  ReadingView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/5/21.
//

import Foundation
import SwiftUI
import CoreData

struct ReadingView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
//    @State var readingObjectID = ReadingCD.objectID
//    @State private var editReadingData = Reading.Data()
    @State private var isEditPresented = false
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    let currentDate = Date()
    var reading: ReadingCD
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Title")) {
                    Text(reading.title ?? "")
                }
                
                Section(header: Text("Date")) {
                    //substituting todays date
                    Text(dateFormatter.string(from: reading.date ?? Date() ))
                }
                
                Section(header: Text("Notes")) {
                    Text(reading.notes ?? "")
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarItems(trailing: Button("Edit") {
                isEditPresented = true
                //data = reading.data
            })
            .navigationTitle(reading.title ?? "")
                NavigationLink(destination: EditView(reading: reading)) {
                    Text("\(reading.title ?? "")")
                        .padding()
                }
            }
        }
    }

//struct ReadingView_Previews: PreviewProvider {
//    static var readingObjectId = ReadingCD.init().objectID
//    static var readingContext = ReadingCD.init().managedObjectContext
//    static var previews: some View {
//        ReadingView()
//    }
//}
