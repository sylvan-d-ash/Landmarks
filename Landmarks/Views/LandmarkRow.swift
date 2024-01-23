//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Sylvan Ash on 15/01/2024.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)

            Text(landmark.name)

            Spacer()

            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview("Turtle Rock") {
    LandmarkRow(landmark: DataService.shared.landmarks[0])
}

#Preview("Silver Salmon") {
    LandmarkRow(landmark: DataService.shared.landmarks[1])
}

#Preview("Grouped") {
    Group {
        LandmarkRow(landmark: DataService.shared.landmarks[2])
        LandmarkRow(landmark: DataService.shared.landmarks[3])
    }
}
