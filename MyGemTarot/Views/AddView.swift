//
//  AddView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/6/21.
//

import SwiftUI
import CoreData

struct AddView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    @State private var dataAlert = false
    @State private var titleString = ""
    @State private var dateObject = Date()
    @State private var notesString = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                TextField("Choose a title", text: $titleString)
                    .padding()
                DatePicker (selection: $dateObject, in: ...Date(), displayedComponents: .date) {
                    Text("Select a date")
                }
                .padding()
                
                TextEditor(text: $notesString)
            }.alert(isPresented: $dataAlert) {
                Alert(title: Text("Invalid data"), message: Text("Reading must have a title (2 characters long, only letters), date (not in the future), and a note (1-500 characters long)"), dismissButton: .cancel())
            }
        }
        .navigationTitle("New Reading")
        .navigationBarItems(trailing: Button("Add") {
            self.saveReading()
        })
    }
    
    private func saveReading() {
        let newReading = ReadingCD(context: self.managedObjectContext)
        newReading.title = titleString
        newReading.date = dateObject
        newReading.notes = notesString
        newReading.id = UUID()
        
        do {
            try self.managedObjectContext.save()
            //Always a good idea to dimiss after saving
            self.presentationMode.wrappedValue.dismiss()
        } catch {
            self.managedObjectContext.delete(newReading)
            self.dataAlert.toggle()
            //            #if DEBUG
            //            fatalError()
            //            #endif
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
