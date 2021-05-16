//
//  CategoryRow.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-03.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI
import MapKit
import Combine

struct CategoryRow: View {
    var categoryName: String
    var items: [LandmarkViewModel]
    @ObservedObject var locationManager = LocationManager()
    
    var userLocation: CLLocation {
        return CLLocation(latitude: locationManager.location?.coordinate.latitude ?? 0, longitude: locationManager.location?.coordinate.longitude ?? 0)
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(LocalizedStringKey(returnLocalizedCategoryName(title: categoryName)))
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 20)
                .padding(.bottom, 10)
            if returnFilteredItems(items: items).count > 0 {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        Section {
                            ForEach(returnFilteredItems(items: items)) { landmarkViewModel in
                                NavigationLink(destination: LandmarkDetail(landmarkViewModel: landmarkViewModel)){
                                    CategoryItem(landmarkViewModel: landmarkViewModel, distanceToItem: self.returnDistanceFromObject(item: landmarkViewModel))
                                }
                                .padding(.bottom, 20)
                            }
                        }
                    }.animation(.default)
                }
                .frame(height: 185)
            }
            else {
                NavigationLink(destination: LandmarkList()){
                    Text("notfound \(LandmarkObject.Category.getTitleFor(title: categoryName))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.leading, 15)
                        .padding(.bottom, 185)
                        .padding(.trailing, 8)
                }
            }
        }
    }
    
    func returnLocalizedCategoryName(title: String) -> String {
        if title == "Museums" {
            return "MuseumsNearby"
        }
        return "ObjectsNearby"
    }
    
    func returnFilteredItems(items: [LandmarkViewModel]) -> [LandmarkViewModel]{
        return items.filter {
//            let smallestDistance = 1000.0
            let smallestDistance = Double.greatestFiniteMagnitude
            let distance = self.returnDistanceFromObject(item: $0)
            if distance < smallestDistance {
                return true
            }
            return false
        }
    }
    
    func returnDistanceFromObject(item: LandmarkViewModel) -> CLLocationDistance {
        let objectLocation = CLLocation(latitude: item.landmark.locationCoordinate.latitude, longitude: item.landmark.locationCoordinate.longitude)
        return objectLocation.distance(from: userLocation)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarkListViewModel = LandmarkListViewModel()
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarkListViewModel.landmarkViewModels[0].landmark.category.rawValue,
            items: Array(arrayLiteral: landmarkListViewModel.landmarkViewModels[0])
        )
    }
}
