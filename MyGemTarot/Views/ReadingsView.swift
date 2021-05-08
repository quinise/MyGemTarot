//
//  ReadingsView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/5/21.
//

import SwiftUI

struct ReadingsView: View {
    @ObservedObject var readingData: ReadingData
    @Environment(\.scenePhase) private var scenePhase
    @Binding var readings: [Reading]
    @State var reading: Reading
    @State var chosenReading: Reading
    @State var addIsPresented = false
    @State var isReadingViewPresented = false
    @State private var newReadingData = Reading.Data()
    let saveAction: () -> Void
    
    var body: some View {
        List {
            ForEach(readings[0..<(readings.count)]) { reading in
                    Button(reading.title) {
                        chosenReading = reading
                        isReadingViewPresented = true
                    }
                    .background(Color(UIColor.systemTeal))
                    .font(.system(size:32)) // prefered to title
                    .foregroundColor(.white) // font color
                    .cornerRadius(8)
                    .padding()
                    .fullScreenCover(isPresented: $isReadingViewPresented) {
                        ReadingView(reading: chosenReading)
                    }
            }
            .onDelete { indices in
                readingData.readings.remove(atOffsets: indices)
                // stop back from being envoked
            }
        }
        .navigationTitle("Readings")
        .navigationBarItems(trailing: Button(action: {
            addIsPresented = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $addIsPresented) {
            NavigationView {
                AddView(readingData: $newReadingData)
                    .navigationBarItems(leading: Button("Cancel") {
                        addIsPresented = false
                    }, trailing: Button("Add") {
                        let newReading = Reading(title: newReadingData.title, date: newReadingData.date, notes: newReadingData.notes)
                        readings.append(newReading)
                        addIsPresented = false
                        readingData.save()
                        if newReading.validate {
                            readings.append(newReading)
                            addIsPresented = false
                            readingData.save()
                        } else if !newReading.validate {
                            let _:Reading? = nil
                            return
                        }
                    })
                }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
    
    private func binding(for reading: Reading) -> Binding<Reading> {
        guard let readingIndex = readings.firstIndex(where: {
            $0.id == reading.id }) else {fatalError("Can't find reading in array")}
            return $readings[readingIndex]
    }
    
    private func delete(at offsets: IndexSet) {
        readings.remove(atOffsets: offsets)
        }
    
}

struct ReadingsView_Previews: PreviewProvider {
    @State static var readingData = ReadingData()
    @State static var reading = Reading.data[0]
    static var previews: some View {
        ReadingsView(readingData: readingData, readings: .constant(Reading.data), reading: reading, chosenReading: reading, saveAction: {})
    }
}
