//
//  LandmarkDetails.swift
//  Landmarks
//
//  Created by Sylvan Ash on 15/01/2024.
//

import SwiftUI

struct LandmarkDetails: View {
    private enum Dimensions {
        static let imageHeight: CGFloat = 260
        static let mapHeight: CGFloat = 300
    }

    var landmark: Landmark

    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: Dimensions.mapHeight)

            CircleImage(image: landmark.image)
                .frame(height: Dimensions.imageHeight)
                .offset(y: -Dimensions.imageHeight/2)
                .padding(.bottom, -Dimensions.imageHeight/2)

            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .foregroundColor(Color.pink)

                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()

            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetails(landmark: DataService.shared.landmarks[0])
}
