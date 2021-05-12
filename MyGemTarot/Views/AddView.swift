//
//  AddView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/6/21.
//

import SwiftUI
import CoreData

struct AddView: View {
//    @Binding var readingData: Reading.Data
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var date = Date()
    @State private var notes = ""
    
    var body: some View {
       NavigationView {
        VStack(spacing: 12) {
            TextField("Choose a title", text: $title)
                .padding()
            DatePicker (selection: $date, in: ...Date(), displayedComponents: .date) {
                Text("Select a date")
            }
                .padding()

            MultilineTextField(text: $notes)
                .padding()
                .border(Color.gray.opacity(0.5), width: 1)
                .background(Color.white)
                .cornerRadius(10)
        }
        
       }
       .navigationTitle("New Reading")
       .navigationBarItems(leading: Button("Cancel") {
        self.presentationMode.wrappedValue.dismiss()
       }, trailing: Button("Add") {
        self.saveReading()
       })
    }
    
    private func saveReading() {
        let newReading = ReadingCD(context: self.managedObjectContext)
        newReading.title = title
        newReading.date = date
        newReading.notes = notes
        newReading.id = UUID()

        do {
            try self.managedObjectContext.save()
            //Always a good idea to dimiss after saving
            self.presentationMode.wrappedValue.dismiss()
        } catch {
            print(error)
            #if DEBUG
            fatalError()
            #endif
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}

