//
//  ReadingView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/5/21.
//

import Foundation
import SwiftUI

struct ReadingView: View {
    @Binding var reading: Reading
    @State private var date: Reading.Data = Reading.Data()
    @Environment(\.presentationMode) var presentationMode


    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Title")) {
                    Text(reading.title)
                }
                
                Section(header: Text("Date")) {
                    Text(reading.date)
                }
                
                Section(header: Text("Notes")) {
                    Text(reading.notes)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                }
            }
        }
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingView(reading: .constant(Reading.data[0]))
    }
}
