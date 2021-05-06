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
            //            MapView(coordinate: landmarkViewModel.landmark.locationCoordinate)
            //                .frame(height: 300)
            //                .edgesIgnoringSafeArea(.top)
            VStack(alignment: .leading) {
                CircleImage(image: landmarkViewModel.landmark.image)
                HStack {
                    Spacer()
                    VStack {
                        RatingSelectView(landmarkViewModel: landmarkViewModel, rating: .constant(landmarkViewModel.landmark.rating), ratingCount: .constant(landmarkViewModel.landmark.ratingCount))
                            .padding(.bottom, 5)
                        
                        Text("Rate it!")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                HStack {
                    Text("Description")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    Button (action: {
                        print("Navigates")
                        
                    }) {
                        Text("Navigation")
                            .fontWeight(.bold)
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                        }
                    
                    Button (action: {
                        print("opens maps")
                    }) {
                            Text("Find in maps")
                            .fontWeight(.bold)
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }

                }
                Text(landmarkViewModel.landmark.description)
                    .padding(.top, 10)
                
            }
            .padding()
        }
        .navigationBarTitle(Text(landmarkViewModel.landmark.name), displayMode: .inline)
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
