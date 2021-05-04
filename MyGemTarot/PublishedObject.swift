//
//  PublishedObject.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/1/21.
//

import SwiftUI
import Combine


class PublishedObject<Wrapped: Publisher>: LoadableObject {
    @Published private(set) var state = LoadingState<Wrapped.Output>.idle
    
    private let publisher: Wrapped
    private var cancellable: AnyCancellable?
    
    init(publisher: Wrapped) {
        self.publisher = publisher
    }
    
    func load() {
        state = .loading
        
        cancellable = publisher
            .map(LoadingState.loaded)
            .catch {error in
                Just(LoadingState.failed(error))
            }
            .sink {[weak self] state in
                self?.state = state
                
            }
    }
}
