//
//  LandmarkDetail.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-03.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmarkViewModel: LandmarkViewModel
    
//    var landmarkIndex: Int {
//        modelData.landmarkObjects.firstIndex(where: { $0.id == landmarkObject.id })!
//    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmarkViewModel.landmark.locationCoordinate)
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)

            CircleImage(image: landmarkViewModel.landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(landmarkViewModel.landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
//                    FavoriteButton(isSet: $modelData.landmarkObjects[landmarkIndex].isFavorite)
                }

                HStack {
                    Spacer()
//                    RatingSelectView(rating: $modelData.landmarkObjects[landmarkIndex].rating, ratingCount: $modelData.landmarkObjects[landmarkIndex].ratingCount)
                    Spacer()
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(landmarkViewModel.landmark.name)")
                    .font(.title)
                Text(landmarkViewModel.landmark.description)
            }
            .padding()
        }
        .navigationBarTitle(landmarkViewModel.landmark.name)
//        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct LandmarkDetail_Previews: PreviewProvider {
//    static let modelData = ModelData()
//    
//    static var previews: some View {
//        LandmarkDetail(landmarkObject: modelData.landmarkObjects[0])
//        .environmentObject(modelData)
//    }
//}
