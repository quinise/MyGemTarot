//
//  CardsObjectController.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import Foundation
import SwiftUI

class CardsObjectController : ObservableObject {
    static let shared = CardsObjectController()
    private init() {} // only call functions through shared protocols
    
    @Published var results = [Card]()
    
    func GETCards() {
        let url = URL(string: "https://rws-cards-api.herokuapp.com/api/v1/cards")
        guard url != nil else {
            print("Error creating url object")
            return
        }
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let res = try JSONDecoder().decode(Cards.self, from: data)
                self.results.append(contentsOf: res.cards)
                print("results ", self.results)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
