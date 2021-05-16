//
//  LandmarkDetail.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-03.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    var landmarkViewModel: LandmarkViewModel
    
    //    var landmarkIndex: Int {
    //        modelData.landmarkObjects.firstIndex(where: { $0.id == landmarkObject.id })!
    //    }
    
    private func openMapForPlace() {

//        let latitude: CLLocationDegrees = 37.2
//        let longitude: CLLocationDegrees = 22.9
//
        let regionDistance:CLLocationDistance = 10000
//        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let coordinates = landmarkViewModel.landmark.locationCoordinate
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = landmarkViewModel.landmark.name
//        mapItem.description = "3-story 15th-century brick tower"
        mapItem.openInMaps(launchOptions: options)
    }
    
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
                        
                        Text("RateIt")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                HStack {
                    
                    Button (action: {
                        self.openMapForPlace()
                    }) {
                        Text("Navigation")
                            .fontWeight(.bold)
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(7)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                        }
                    
                        Button (action: {
                            print("Success")
                        }) {
                            NavigationLink (destination: MapSectionView(localLandmarkCoordinates: landmarkViewModel.landmark.locationCoordinate)){
                                Text("find-in-maps")
                                .fontWeight(.bold)
                                .font(.caption)
                                .foregroundColor(.blue)
                                .padding(7)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.blue, lineWidth: 2)
                                )
                            }
                        }
                        if landmarkViewModel.landmark.category == LandmarkObject.Category.museums {
                            Button (action: {
                                print("Success")
                            }) {
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
                            }
                        }
                    }

                Text("Description")
                .font(.title)
                .multilineTextAlignment(.center)

                
                Text(landmarkViewModel.landmark.description)
                    .padding(.top, 10)
                
            }
            .padding()
        }
        .navigationBarTitle(Text(landmarkViewModel.landmark.name), displayMode: .inline)
    }
}
