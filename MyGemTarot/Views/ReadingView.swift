//
//  ReadingView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/5/21.
//

import Foundation
import SwiftUI

struct ReadingView: View {
    let reading: Reading
    @Environment(\.presentationMode) var presentationMode
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Title")) {
                    Text(reading.title)
                }
                
                Section(header: Text("Date")) {
                    Text(reading.date, formatter: dateFormatter)
                }
                
                Section(header: Text("Notes")) {
                    Text(reading.notes)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                }
            }
            .navigationTitle(reading.title)
        }
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var reading = Reading.data[0]
    static var previews: some View {
        ReadingView(reading: reading)
    }
}
