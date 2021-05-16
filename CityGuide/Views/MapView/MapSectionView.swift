//
//  MapView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-04.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI
import MapKit
struct MapSectionView: View {
    var localLandmarkCoordinates: CLLocationCoordinate2D?
    @ObservedObject var locationManager = LocationManager()
    @ObservedObject var landmarkListViewModel = LandmarkListViewModel()
    @State private var localLandmarks: [LocalLandmark] = [LocalLandmark]()
    @State private var search: String = ""
    @State private var isEditing: Bool = false
    @State private var tapped: Bool = false
    
    private func getNearByLandmarks() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                let mapItems = response.mapItems
                self.localLandmarks = mapItems.map {
                    LocalLandmark(placemark: $0.placemark)
                }
            }
        }
    }
    
    func calculateOffset() -> CGFloat {
        if self.landmarkListViewModel.landmarkViewModels.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
        } else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    var body: some View {
        ZStack (alignment: .top) {
            MapUIView(landmarkListViewModel: landmarkListViewModel, localLandmarkCoordinates: localLandmarkCoordinates, localLandmarks: localLandmarks)
            SearchBarUI(text: $search, isEditing: $isEditing)
            PlaceListView(landmarkViewModels: landmarkListViewModel.landmarkViewModels) {
                self.tapped.toggle()
            }
            .animation(.spring())
                .offset(y: calculateOffset())
        }
    }
}

struct MapSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MapSectionView()
    }
}
