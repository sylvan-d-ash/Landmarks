//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Sylvan Ash on 14/05/2024.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)

            Text(landmark.name)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    let landmark = DataService().landmarks[0]
    return CategoryItem(landmark: landmark)
}
