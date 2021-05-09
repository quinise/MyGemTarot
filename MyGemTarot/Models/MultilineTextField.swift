//
//  MultilineTextField.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/9/21.
//

import Foundation
import SwiftUI

struct MultilineTextField: UIViewRepresentable {
    @Binding var text: String
    
    func makeCoordinator() -> Coordinator {
        return MultilineTextField.Coordinator(parent1: self)
    }
        
    func makeUIView(context: UIViewRepresentableContext<MultilineTextField>) -> UITextView {
        let view = UITextView()
        view.font = .systemFont(ofSize: 19)
        view.text = "Type notes..."
        view.textColor = UIColor.black.withAlphaComponent(0.35)
        view.backgroundColor = .clear
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: MultilineTextField.UIViewType, context: UIViewRepresentableContext<MultilineTextField>) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultilineTextField
        
        init(parent1: MultilineTextField){
            parent = parent1
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .black
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .label
        }
    }
}

