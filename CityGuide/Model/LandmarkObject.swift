//
//  LandmarkObject.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-02.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct LandmarkObject: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var rating: Double
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var ratingCount: Int
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case museums = "Museums"
        case objects = "Objects"
    }
    
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
