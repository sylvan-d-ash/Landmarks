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
                ForEach(dataService.categories.keys.sorted(), id: \.self) { key in
                    let landmarks = dataService.categories[key] ?? []
                    CategoryRow(categoryName: key, landmarks: landmarks)
                }
            }
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    CategoriesHome()
        .environment(DataService())
}
