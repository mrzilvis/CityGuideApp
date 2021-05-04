//
//  RatingOverlay.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-03.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct RatingOverlay: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: LandmarkObject
    
    var landmarkIndex: Int {
        modelData.landmarkObjects.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ZStack {
            HStack{
                Text(String(modelData.landmarkObjects[landmarkIndex].rating))
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Image(systemName: "star.fill")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .padding(6)
        }
    }
}

struct RatingOverlay_Previews: PreviewProvider {
    static var previews: some View {
        RatingOverlay(landmark: ModelData().landmarkObjects[0])
    }
}
