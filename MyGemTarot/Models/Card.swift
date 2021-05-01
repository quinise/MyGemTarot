//
//  Card.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 4/30/21.
//

import Foundation
import SwiftUI

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
}
