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

struct EditView: View {
    @Binding var readingData: Reading.Data

    var body: some View {
       NavigationView {
        VStack(spacing: 12) {
            // Include placeholders of existing data in each field, validate each field
            TextField("Choose a title", text: $readingData.title)
                .padding()
            DatePicker (selection: $readingData.date, in: ...Date(), displayedComponents: .date) {
                Text("Select a date")
            }
                .padding()

            MultilineTextField(text: $readingData.notes)
                .padding()
                .border(Color.gray.opacity(0.5), width: 1)
                .background(Color.white)
                .cornerRadius(10)
        }
        
       }
       .navigationTitle("Edit Reading")
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(readingData: .constant(Reading.data[0].data))
    }
}
