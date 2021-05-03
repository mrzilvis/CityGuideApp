//
//  LandmarkDetail.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-03.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmarkObject: LandmarkObject
    
    var landmarkIndex: Int {
        modelData.landmarkObjects.firstIndex(where: { $0.id == landmarkObject.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmarkObject.locationCoordinate)
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)

            CircleImage(image: landmarkObject.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(landmarkObject.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landmarkObjects[landmarkIndex].isFavorite)
                }

                HStack {
                    Text(String(landmarkObject.rating))
                    Spacer()
                    Text(landmarkObject.name)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(landmarkObject.name)")
                    .font(.title)
                Text(landmarkObject.description)
            }
            .padding()
        }
        .navigationBarTitle(landmarkObject.name)
//        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmarkObject: modelData.landmarkObjects[0])
        .environmentObject(modelData)
    }
}
