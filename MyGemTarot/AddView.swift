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
        Form {
            EntryField(label: "Choose a title", placeholder: "My Reading", prompt: "Enter a title", field: $readingData.title)
            EntryField(label: "Choose a date", placeholder: "5/4/2011", prompt: "Enter a date", field: $readingData.date)
            EntryField(label: "Type some notes", placeholder: "Notes...", prompt: "Enter a note", field: $readingData.notes)
        }
        
       }
       .navigationTitle("New Reading")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(readingData: .constant(Reading.data[0].data))
    }
}

struct EntryField: View {
    var label: String
    var placeholder: String
    var prompt: String
    @Binding var field: String
    var isSecure:Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(label)
                if isSecure {
                    SecureField(placeholder, text: $field).autocapitalization(.none)
                } else {
                    
                    TextField(placeholder, text: $field).autocapitalization(.none)
                }
            }
            .padding(8)
            .background(Color(UIColor.secondarySystemBackground))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            Text(prompt)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
        }
    }
}
