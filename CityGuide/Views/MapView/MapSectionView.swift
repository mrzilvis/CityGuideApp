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
    
    @ObservedObject var locationManager = LocationManager()
    @State private var localLandmarks: [LocalLandmark] = [LocalLandmark]()
    @State private var search: String = ""
    
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
    
    var body: some View {
        ZStack (alignment: .top) {
            MapUIView(localLandmarks: localLandmarks)
            TextField("Search", text: $search, onEditingChanged: { _ in})
            {
                self.getNearByLandmarks()
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .offset(y:44)
        }
    }
}

struct MapSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MapSectionView()
    }
}
