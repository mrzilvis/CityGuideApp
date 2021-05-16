//
//  LandmarkViewModel.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-05.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import Combine
import MapKit

class LandmarkViewModel: ObservableObject, Identifiable {
    private let landmarkRepository = LandmarkRepository()
    private var locationManager = LocationManager()
    @Published var landmark: LandmarkObject
    
    
    private var cancellables: Set<AnyCancellable> = []
    
    var id = ""
    
    init(landmark: LandmarkObject) {
        self.landmark = landmark
        
        $landmark
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    func update(landmark: LandmarkObject) {
      landmarkRepository.update(landmark)
    }
    
    var userLocation: CLLocation {
        return CLLocation(latitude: locationManager.location?.coordinate.latitude ?? 0, longitude: locationManager.location?.coordinate.longitude ?? 0)
    }
    
    func returnDistanceFromObject(item: LandmarkViewModel) -> CLLocationDistance {
        let objectLocation = CLLocation(latitude: item.landmark.locationCoordinate.latitude, longitude: item.landmark.locationCoordinate.longitude)
        return objectLocation.distance(from: userLocation)
    }
}
