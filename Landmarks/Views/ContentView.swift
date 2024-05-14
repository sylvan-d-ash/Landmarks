//
//  ContentView.swift
//  Landmarks
//
//  Created by Sylvan Ash on 11/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featuredLandmarks

    enum Tab {
        case featuredLandmarks
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            CategoriesHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featuredLandmarks)

            LandmarksList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(DataService())
}
