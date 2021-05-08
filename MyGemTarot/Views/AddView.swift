//
//  AddView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/6/21.
//

import SwiftUI

struct AddView: View {
    @Binding var readingData: Reading.Data
    
    var body: some View {
       NavigationView {
        VStack(spacing: 12) {
            TextField("Choose a title", text: $readingData.title)
                .padding()
            TextField("Choose a Date", text: $readingData.date)
                .padding()

            MultilineTextField(text: $readingData.notes)
                .padding()
                .border(Color.gray.opacity(0.5), width: 1)
                .background(Color.white)
                .cornerRadius(10)
        }
        
       }
       .navigationTitle("New Reading")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(readingData: .constant(Reading.data[0].data))
    }
}

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

struct EntryField: View {
    var label: String
    var placeholder: String
    var prompt: String
    @Binding var field: String
    var isSecure:Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(label)
                if isSecure {
                    SecureField(placeholder, text: $field).autocapitalization(.none)
                } else {
                    
                    TextField(placeholder, text: $field).autocapitalization(.none)
                }
            }
            .padding(8)
            .background(Color(UIColor.secondarySystemBackground))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            Text(prompt)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
        }
    }
}
