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
    var date: String
    var notes: String
    
    init(id: UUID = UUID(), title: String, date: String, notes: String) {
        self.id = id
        self.title = title
        self.date = date
        self.notes = notes
    }
}

extension Reading {
    static var data: [Reading] {
        [
            Reading(title: "Love Life", date: "5/1/2021", notes: "I was upright this reading. The Lovers did not appear, but my past was cumbersome."),
            Reading(title: "Work Life", date: "5/2/2021", notes: "I need to be more patient with myself and slow my pace down. Remember self-care!"),
            Reading(title: "Destiny", date: "5/3/2021", notes: "No one knows the full story until the end...")
        ]
    }
}

extension Reading {
    struct Data {
        var title: String = ""
        var date: String = ""
        var notes: String = ""
    }
    
    var data: Data {
        return Data(title: title, date: date, notes: notes)
    }
}
