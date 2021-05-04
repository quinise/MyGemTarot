//
//  ArcanaViewModel.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/1/21.
//

import Foundation
import SwiftUI

class ArcanaViewModel: ObservableObject {
    enum LoadingState<Value> {
        case idle
        case loading
        case failed(Error)
        case loaded(Value)
    }
    
    @Published private(set) var state = LoadingState.idle
    
    private let cards: Cards
    private let loader: CardsLoader
    
    init(cards: Cards, loader: CardsLoader) {
        self.cards = cards
        self.loader = loader
    }
    
    func load() {
           state = .loading

           loader.loadCards(withCards: cards) { [weak self] result in
               switch result {
               case .success(let article):
                   self?.state = .loaded(article)
               case .failure(let error):
                   self?.state = .failed(error)
               }
           }
       }
}
