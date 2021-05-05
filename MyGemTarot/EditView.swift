//
//  EditView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/5/21.
//

import SwiftUI

struct EditView: View {
    @Binding var readingData: Reading.Data
    @State private var newReading = ""
    @State private var title = ""
    @State private var date = ""
    @State private var notes = ""

    var body: some View {
        Form {
            TextField("Choose a title", text: $readingData.title)
            
            TextField("Choose a date", text: $readingData.date)
            
            TextField("Type some notes", text: $readingData.notes)
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(readingData: .constant(Reading.data[0].data))
    }
}
