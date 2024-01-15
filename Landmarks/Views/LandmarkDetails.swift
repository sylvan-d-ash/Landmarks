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

    var body: some View {
        VStack {
            MapView()
                .frame(height: Dimensions.mapHeight)

            CircleImage()
                .frame(height: Dimensions.imageHeight)
                .offset(y: -Dimensions.imageHeight/2)
                .padding(.bottom, -Dimensions.imageHeight/2)

            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                    .foregroundColor(Color.pink)

                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()

                Text("About Turtle Rock")
                    .font(.title2)
                Text("Description text goes here...")
            }
            .padding()

            Spacer()
        }
    }
}

#Preview {
    LandmarkDetails()
}
