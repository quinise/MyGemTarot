//
//  ReadingsView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/5/21.
//

import SwiftUI

struct ReadingsView: View {
    @Environment(\.scenePhase) private var scenePhase
    @Binding var readings: [Reading]
    @State var editIsPresented = false
    @State var isReadingViewPresented = false
    @State private var newReadingData = Reading.Data()
    let saveAction: () -> Void
    
    var body: some View {
        List {
            ForEach(readings) { reading in
                    Button(reading.title) {
                        isReadingViewPresented = true
                    }
                    .background(Color(UIColor.systemTeal))
                    .font(.system(size:32)) // prefered to title
                    .foregroundColor(.white) // font color
                    .cornerRadius(8)
                    .padding()
                    .fullScreenCover(isPresented: $isReadingViewPresented) {
                        ReadingView(reading: binding(for: reading))
                    }
            }
            .onDelete(perform: delete)
        }
        .navigationTitle("Readings")
        .navigationBarItems(trailing: Button(action: {
            editIsPresented = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $editIsPresented) {
            NavigationView {
                EditView(readingData: $newReadingData)
                    .navigationBarItems(leading: Button("Cancel") {
                        editIsPresented = false
                    }, trailing: Button("Add") {
                        let newReading = Reading(title: newReadingData.title, date: newReadingData.date, notes: newReadingData.notes)
                        readings.append(newReading)
                        editIsPresented = false
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
    static var previews: some View {
        ReadingsView(readings: .constant(Reading.data), saveAction: {})
    }
}
