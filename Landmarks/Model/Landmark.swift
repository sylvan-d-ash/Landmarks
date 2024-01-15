//
//  Landmark.swift
//  Landmarks
//
//  Created by Sylvan Ash on 15/01/2024.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Decodable {
    struct Coordinates: Hashable, Decodable {
        let latitude: Double
        let longitude: Double
    }

    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String

    private let imageName: String
    var image: Image { Image(imageName) }

    private let coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}
