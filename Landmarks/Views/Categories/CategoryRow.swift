//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Sylvan Ash on 14/05/2024.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var landmarks: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(landmarks) { landmark in
                        NavigationLink {
                            LandmarkDetails(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let landmarks = DataService().landmarks

    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        landmarks: Array(landmarks.prefix(3))
    )
}
