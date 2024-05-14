//
//  DataService.swift
//  Landmarks
//
//  Created by Sylvan Ash on 15/01/2024.
//

import Foundation

@Observable
class DataService {
    var landmarks: [Landmark] = load("landmarkData.json")

    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks, by: { $0.category.rawValue })
    }

    static func load<T: Decodable>(_ filename: String) -> T {
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle")
        }

        let data: Data

        do {
            let decoder = JSONDecoder()
            data = try Data(contentsOf: file)
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Error loading file: \(error.localizedDescription)")
        }
    }
}
