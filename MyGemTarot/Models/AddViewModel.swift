//
//  AddViewModel.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/6/21.
//

import Foundation
import SwiftUI

struct BrokenRule {
    let message: String
}

class AddViewModel: ObservableObject {
    @Published var title = ""
    @Published var date = ""
    @Published var notes = ""
    
    // MARK: - Validation Functions
    
    func isTitleValid() -> Bool {
        let titleTest = NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z0-9]{1,15}$")
        return titleTest.evaluate(with: title)
    }

    func isNotesValid() -> Bool {
        let notesTest = NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z0-9]{1,250}$")
        return notesTest.evaluate(with: notes)
    }
    
    var isAddComplete: Bool {
        if !isTitleValid() || !isNotesValid() {
            return false
        }
        return true
    }
    
    // MARK: - Validation Prompt Strings
    
    var titlePrompt: String {
        if isTitleValid() {
            return ""
        } else {
            return "Enter title"
        }
    }

    var datePrompt: String {
        return "Enter a date"
    }
    
    var notesPrompt: String {
        if isNotesValid() {
            return ""
        } else {
            return "Enter notes..."
        }
    }
    
    func add() {
        title = ""
        date = ""
        notes = ""
    }
}
