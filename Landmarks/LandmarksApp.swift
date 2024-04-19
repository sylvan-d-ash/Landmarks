//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Sylvan Ash on 11/01/2024.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var dataService = DataService()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataService)
        }
    }
}
