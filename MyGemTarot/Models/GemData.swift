//
//  GemData.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/4/21.
//

/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

class GemData: ObservableObject {
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("scrums.data")
    }
    @Published var gems: [Gem] = []

    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.gems = Gem.data
                }
                #endif
                return
            }
            guard let listGems = try? JSONDecoder().decode([Gem].self, from: data) else {
                fatalError("Can't decode saved scrum data.")
            }
            DispatchQueue.main.async {
                self?.gems = listGems
            }
        }
    }
    
    //likely delete
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let gems = self?.gems else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(gems) else { fatalError("Error encoding data") }
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
}
