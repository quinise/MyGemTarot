//
//  Reading.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/5/21.
//

import Foundation
import SwiftUI

struct Reading: Identifiable, Codable {
    let id: UUID
    var title: String
    var date: Date
    var notes: String
    
    init(id: UUID = UUID(), title: String, date: Date, notes: String) {
        self.id = id
        self.title = title
        self.date = date
        self.notes = notes
    }
    
    func isTitleValid() -> Bool {
        let titleTest = NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z0-9]{1,15}$")
        return titleTest.evaluate(with: title)
    }

    func isNotesValid() -> Bool {
        let notesTest = NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]{1,250}$")
        return notesTest.evaluate(with: notes)
    }
    
    func isDateValid() -> Bool {
        if date > Date() {
            return false
        } else {
            return true
        }
    }
    
    var validate: Bool {
        if !isTitleValid() || !isNotesValid() || !isDateValid() {
            return false
        }
        return true
    }
}

extension Reading {
    static var data: [Reading] {
        [
            Reading(title: "Love Life", date: Date(), notes: "I was upright this reading. The Lovers did not appear, but my past was cumbersome."),
            Reading(title: "Work Life", date: Date(), notes: "I need to be more patient with myself and slow my pace down. Remember self-care!"),
            Reading(title: "Destiny", date: Date(), notes: "No one knows the full story until the end...")
        ]
    }
}

extension Reading {
    struct Data {
        var title: String = ""
        var date: Date = Date()
        var notes: String = ""
    }
    
    var data: Data {
        return Data(title: title, date: date, notes: notes)
    }
}
