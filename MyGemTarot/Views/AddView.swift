//
//  AddView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/6/21.
//

import SwiftUI

struct AddView: View {
    @Binding var readingData: Reading.Data
    
    var body: some View {
       NavigationView {
        VStack(spacing: 12) {
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
       .navigationTitle("New Reading")
    }
}

