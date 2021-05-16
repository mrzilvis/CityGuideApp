//
//  LandmarkCard.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-04.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct LandmarkCard: View {
    var landmarkViewModel: LandmarkViewModel
    
//    var landmarkIndex: Int {
//         modelData.landmarkObjects.firstIndex(where: { $0.id == landmark.id })!
//     }
    
    var body: some View {
        VStack {
            landmarkViewModel.landmark.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 200)
                .clipped()
                .overlay(DistanceOverlay(distance: Int(landmarkViewModel.returnDistanceFromObject(item: landmarkViewModel))), alignment: .topLeading)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(landmarkViewModel.landmark.name)
                        .font(.headline)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    HStack {
                        Text(String(landmarkViewModel.landmark.rating))
                            .font(.headline)
                            .foregroundColor(.yellow)
                            .padding(.trailing, 5)

                        RatingView(rating: .constant(landmarkViewModel.landmark.rating), ratingCount: .constant(landmarkViewModel.landmark.ratingCount))
                    }
                    if landmarkViewModel.landmark.category == LandmarkObject.Category.museums {
                        NavigationLink (destination: ARContentView()){
                            Text("virtualExcursion")
                            .fontWeight(.bold)
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(7)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                        }
                        .padding(3)
                    }
                    Text(landmarkViewModel.landmark.description)
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
