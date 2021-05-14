//
//  ContentView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/8/21.
//

import SwiftUI

struct ContentView: View {
    @Binding public var cards: [Card]
    @Binding public var gems: [Gem]
    @State var animate = false
    @State var endSplash = false
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        ZStack {
            SuitsView(cards: $cards, gems: .constant(Gem.data))
            ZStack {
                Color("bg")
                Image("AppIcon")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fit : .fit)
                    .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                
                    .scaleEffect(animate ? 3 : 1)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(Animation.easeOut(duration: 0.45)) {
                animate.toggle()
            }
            
            withAnimation(Animation.easeOut(duration: 0.35)) {
                endSplash.toggle()
            }
        }
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
