//
//  AsyncContentView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/1/21.
//

import SwiftUI
import Combine

struct AsyncContentView<Source: LoadableObject, LoadingView: View, Content: View>: View {
    @ObservedObject var cards: Source

    var loadingView: LoadingView
    var content: (Source.Output) -> Content
    
    init(source: Source, loadingView: LoadingView, @ViewBuilder content: @escaping (Source.Output) -> Content) {
                self.cards = source
                self.loadingView = loadingView
                self.content = content
    }
    
    var body: some View {
        switch cards.state {
        case .idle:
            Color.clear.onAppear(perform: cards.load)
        case .loading:
            loadingView
        case .failed(let error):
            ErrorView(error: error, retryHandler: cards.load)
        case .loaded(let output):
            content(output)
        }
    }
}
    
    extension AsyncContentView {
        init<P: Publisher>(
            source: P,
            @ViewBuilder content: @escaping (P.Output) -> Content
        ) where Source == PublishedObject<P> {
            self.init(
                source: PublishedObject(publisher: source),
                content: content
            )
    }
}

typealias DefaultProgressView = ProgressView<EmptyView, EmptyView>

extension AsyncContentView where LoadingView == DefaultProgressView {
    init(
        cards: Source,
        @ViewBuilder content: @escaping (Source.Output) -> Content
    ) {
        self.init(
            cards: cards,
            loadingView: ProgressView(),
            content: content
        )
    }
}

struct AsyncContentView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncContentView()
    }
}
