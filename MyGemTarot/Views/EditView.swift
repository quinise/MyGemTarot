//
//  EditView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/5/21.
//

//
//  AddView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/6/21.
//

import SwiftUI
import CoreData

struct EditView: View {
    @State private var title = ""
    @State private var date = Date()
    @State private var notes = ""
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var reading: ReadingCD

    var body: some View {
       NavigationView {
        VStack(spacing: 12) {
            // Include placeholders of existing data in each field, validate each field
            TextField(reading.title ?? "", text: $title)
                .padding()
            Text(dateFormatter.string(from: reading.date! ) )
                .padding()
            TextEditor(text: $notes)
        }
        .onAppear(perform: {
            title = reading.title ?? ""
            notes = reading.notes ?? ""
        })
       }
       .navigationTitle("Edit Reading")
       .navigationBarItems(leading: Button("Cancel") {
        self.presentationMode.wrappedValue.dismiss()
       }, trailing: Button("Done") {
        self.updateReading()
       })
    }
    
    private func updateReading() {
        reading.title = title
        reading.notes = notes

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

//struct EditView_Previews: PreviewProvider {
////    @State static var reading = ReadingCD()
//    static var previews: some View {
//        EditView()
//    }
//}
