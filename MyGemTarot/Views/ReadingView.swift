//
//  ReadingView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/5/21.
//

import Foundation
import SwiftUI

struct ReadingView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var reading: Reading
    @State private var editReadingData = Reading.Data()
    @State private var isEditPresented = false
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
            .listStyle(InsetGroupedListStyle())
            .navigationBarItems(trailing: Button("Edit") {
                isEditPresented = true
                //data = reading.data
            })
            .navigationTitle(reading.title)
            .fullScreenCover(isPresented: $isEditPresented) {
                NavigationView {
                    EditView(readingData: $editReadingData)
                        .navigationTitle(reading.title)
                        .navigationBarItems(leading: Button("Cancel") {
                            isEditPresented = false
                        }, trailing: Button("Done") {
                            // validate edited reading
//                            if readingToEdit.validate {
//                                isEditPresented = false
//                                readingToEdit.save()
//                            } else {
//                                readingToEdit = readingInData
//                                return
//                            }
                                isEditPresented = false

                        })
                }
            }
        }
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var reading = Reading.data[0]
    static var previews: some View {
        ReadingView(reading: reading)
    }
}
