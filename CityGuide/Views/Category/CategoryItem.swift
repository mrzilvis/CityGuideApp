//
//  CategoryItem.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-03.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct CategoryItem: View {
    var landmarkViewModel: LandmarkViewModel
    var body: some View {
        VStack(alignment: .leading){
            landmarkViewModel.landmark.image
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .frame(width: 200, height: 200)
                .cornerRadius(5)
                .overlay(ImageOverlay(landmark: landmarkViewModel.landmark), alignment: .bottomLeading)
                .overlay(RatingOverlay(landmark: landmarkViewModel.landmark), alignment: .topTrailing)
        }
        .padding(.leading, 15)
    }
}

//struct CategoryItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryItem(landmark: ModelData().landmarkObjects[0])
//    }
//}
