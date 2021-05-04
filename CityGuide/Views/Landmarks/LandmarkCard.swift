//
//  LandmarkCard.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-04.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct LandmarkCard: View {
    var landmark: LandmarkObject
    @EnvironmentObject var modelData: ModelData
    
    var landmarkIndex: Int {
         modelData.landmarkObjects.firstIndex(where: { $0.id == landmark.id })!
     }
    
    var body: some View {
        VStack {
            landmark.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 200)
                .clipped()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.headline)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    HStack {
                        Text(String(landmark.rating))
                            .font(.headline)
                            .foregroundColor(.yellow)
                            .padding(.trailing, 5)
                         
                        RatingView(rating: $modelData.landmarkObjects[landmarkIndex].rating, ratingCount: $modelData.landmarkObjects[landmarkIndex].ratingCount)
                    }
                    Text(landmark.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    .lineLimit(5)
                }
                .layoutPriority(100)
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10)
        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        
        .padding([.top, .horizontal])
    }
}

struct LandmarkCard_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkCard(landmark: ModelData().landmarkObjects[0])
        .environmentObject(ModelData())
    }
}
