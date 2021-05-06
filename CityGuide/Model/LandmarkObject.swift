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
import FirebaseFirestoreSwift

struct LandmarkObject: Identifiable, Codable {
    @DocumentID var id: String?
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
    
    public init(id: String, name: String, rating: Double, description: String, isFavorite: Bool, isFeatured: Bool, ratingCount: Int, category: Category, imageName: String, coordinates: Coordinates) {
        self.id = id
        self.name = name
        self.rating = rating
        self.description = description
        self.isFeatured = isFeatured
        self.isFavorite = isFavorite
        self.ratingCount = ratingCount
        self.category = category
        self.imageName = imageName
        self.coordinates = coordinates
    }
    
}
