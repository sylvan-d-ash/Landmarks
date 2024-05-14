//
//  Landmark.swift
//  Landmarks
//
//  Created by Sylvan Ash on 15/01/2024.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Identifiable, Hashable, Decodable {
    struct Coordinates: Hashable, Decodable {
        let latitude: Double
        let longitude: Double
    }

    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    let category: Category
    var isFavorite: Bool

    private let imageName: String
    var image: Image { Image(imageName) }

    private let coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}
