//
//  ReadingData.swift
//  MyGemTarot
//
//  Created by Devin Ercolano on 5/5/21.
//

import Foundation

class ReadingData: ObservableObject {
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
        return documentsFolder.appendingPathComponent("readings.data")
    }
    @Published var readings: [Reading] = []

    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.readings = Reading.data
                }
                #endif
                return
            }
            guard let listReadings = try? JSONDecoder().decode([Reading].self, from: data) else {
                fatalError("Can't decode saved reading data.")
            }
            DispatchQueue.main.async {
                self?.readings = listReadings
            }
        }
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let readings = self?.readings else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(readings) else { fatalError("Error encoding data") }
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
}
