//
//  Card.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import Foundation
import SwiftUI

// Create a model for each card and a containing array for all the cards recieved in the request

struct Cards: Codable {
    var nhits: Int
    var cards: [Card]
}

struct Card: Codable {
    var name_short: String
    var name: String
    var value: String
    var value_int: Int
    var type: String
    var suit: String?
    var meaning_up: String
    var meaning_rev: String
    var desc: String
    
    init(name_short: String, name: String, value: String, value_int: Int, type: String, suit: String?, meaning_up: String, meaning_rev: String, desc: String) {
        self.name_short = name_short
        self.name = name
        self.value = value
        self.value_int = value_int
        self.type = type
        self.suit = suit
        self.meaning_up = meaning_up
        self.meaning_rev = meaning_rev
        self.desc = desc
    }
}

extension Card {
    static var data: [Card] {
        [
            Card(name_short: "tst sht nm", name: "Test Short Name", value: "10009", value_int: 9000, type: "Test Type", suit: "Test Suit", meaning_up: "Meaning up", meaning_rev: "Meaning down", desc: "test description")
        ]
    }
}

extension Card {
    struct Data {
        var name_short: String = ""
        var name: String = ""
        var value: String = ""
        var value_int: Int = 0
        var type: String = ""
        var suit: String? = ""
        var meaning_up: String = ""
        var meaning_rev: String = ""
        var desc: String = ""
    }
        var data: Data {
            return Data(name_short: name_short, name: name, value: value, value_int: value_int, type: type, suit: suit, meaning_up: meaning_up, meaning_rev: meaning_rev, desc: desc)
        }
}
