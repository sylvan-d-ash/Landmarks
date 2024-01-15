//
//  LandmarksList.swift
//  Landmarks
//
//  Created by Sylvan Ash on 15/01/2024.
//

import SwiftUI

struct LandmarksList: View {
    var body: some View {
        NavigationSplitView {
            List(DataService.shared.landmarks) { landmark in
                NavigationLink {
                    LandmarkDetails()
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    LandmarksList()
}
