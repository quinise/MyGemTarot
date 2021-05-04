//
//  ErrorView.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/1/21.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        Text(error)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: error)
    }
}
