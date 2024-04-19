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

    @Environment(DataService.self) var dataService
    var landmark: Landmark

    var landmarkIndex: Int {
        dataService.landmarks.firstIndex(where: { $0.id == landmark.id }) ?? 0
    }

    var body: some View {
        @Bindable var dataService = dataService

        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: Dimensions.mapHeight)

            CircleImage(image: landmark.image)
                .frame(height: Dimensions.imageHeight)
                .offset(y: -Dimensions.imageHeight/2)
                .padding(.bottom, -Dimensions.imageHeight/2)

            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    .foregroundColor(Color.pink)
                    FavouriteButton(isSet: $dataService.landmarks[landmarkIndex].isFavorite)
                }

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
    let dataService = DataService()
    return LandmarkDetails(landmark: dataService.landmarks[0])
        .environment(dataService)
}
