//
//  WandsView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import SwiftUI

struct CupsView: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
            Text("Hello, Cups!")
        }
        .padding()
        .navigationTitle("Cups")
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

struct WandsView_Previews: PreviewProvider {
    static var previews: some View {
        WandsView()
    }
}
}
