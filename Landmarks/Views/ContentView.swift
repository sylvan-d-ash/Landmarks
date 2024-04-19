//
//  ContentView.swift
//  Landmarks
//
//  Created by Sylvan Ash on 11/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarksList()
    }
}

#Preview {
    ContentView()
        .environment(DataService())
}
