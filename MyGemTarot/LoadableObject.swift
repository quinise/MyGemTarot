//
//  Source.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/1/21.
//

import Foundation
import SwiftUI

protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load()
}
