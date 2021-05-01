//
//  ContentView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import SwiftUI

struct ContentView: View {
    @State var isArcanaViewPresented = false
    @State var isCupsViewPresented = false
    @State var isCoinsViewPresented = false
    @State var isSwordsViewPresented = false
    @State var isWandsViewPresented = false
        
    var body: some View {
        NavigationView {
            VStack {
                Button("Major Arcana") {
                    isArcanaViewPresented = true
                }
                .fullScreenCover(isPresented: $isArcanaViewPresented) {
                    ArcanaView()
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                
                Button("Cups") {
                    isCupsViewPresented = true
                }
                .fullScreenCover(isPresented: $isCupsViewPresented) {
                    CupsView()
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                
                Button("Coins") {
                    isCoinsViewPresented = true
                }
                .fullScreenCover(isPresented: $isCoinsViewPresented) {
                    CoinsView()
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                
                Button("Swords") {
                    isSwordsViewPresented = true
                }
                .fullScreenCover(isPresented: $isSwordsViewPresented) {
                    SwordsView()
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                
                Button("Wands") {
                    isWandsViewPresented = true
                }
                .fullScreenCover(isPresented: $isWandsViewPresented) {
                    WandsView()
                }
                .background(Color(UIColor.systemTeal))
                .font(.system(size:32)) // prefered to title
                .foregroundColor(.white) // font color
                .cornerRadius(8)
                .padding()
                
            }
            .padding()
            .navigationTitle("My Gem Tarot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
