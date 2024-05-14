//
//  CategoriesHome.swift
//  Landmarks
//
//  Created by Sylvan Ash on 14/05/2024.
//

import SwiftUI

struct CategoriesHome: View {
    @Environment(DataService.self) var dataService

    var body: some View {
        NavigationSplitView {
            List {
                if let landmark = dataService.featuredLandmarks.first {
                    landmark.image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .listRowInsets(EdgeInsets()) // extend content to edges
                }

                ForEach(dataService.categories.keys.sorted(), id: \.self) { key in
                    let landmarks = dataService.categories[key] ?? []
                    CategoryRow(categoryName: key, landmarks: landmarks)
                }
                // extend content to edges
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    CategoriesHome()
        .environment(DataService())
}
