//
//  LandmarksList.swift
//  Landmarks
//
//  Created by Sylvan Ash on 15/01/2024.
//

import SwiftUI

struct LandmarksList: View {
    @Environment(DataService.self) var dataService
    @State private var showFavouritesOnly = false

    private var filteredLandmarks: [Landmark] {
        let landmarks = dataService.landmarks
        return landmarks.filter({ !showFavouritesOnly || $0.isFavorite })
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavouritesOnly) {
                    Text("Favourites Only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetails(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
            .animation(.default, value: filteredLandmarks)
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    LandmarksList()
        .environment(DataService())
}
