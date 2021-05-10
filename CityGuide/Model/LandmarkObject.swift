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
    var ratingCount: Int
    var ratedByUserIds: [UserRating]?
    var subtitle: String
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case museums = "Museums"
        case objects = "Objects"
        
        func localizedString() -> String {
            return NSLocalizedString(self.rawValue, comment: "")
        }

        static func getTitleFor(title: String) -> String {
            if title == "Museums" {
                return Category.museums.localizedString()
            } else if title == "Objects" {
                return Category.objects.localizedString()
            }
            return ""
        }
    }
    
    
    struct UserRating: Codable {
        var userId: String
        var ratingGiven: Int
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
        self.ratingCount = ratingCount
        self.category = category
        self.imageName = imageName
        self.coordinates = coordinates
        self.subtitle = ""
    }
    
    public func returnFilteredItems(items: [LandmarkViewModel], userLocation: CLLocation) -> [LandmarkViewModel]{
        return items.filter {
            let smallestDistance = 1000.0
            let objectLocation = CLLocation(latitude: $0.landmark.locationCoordinate.latitude, longitude: $0.landmark.locationCoordinate.longitude)
            let distance = objectLocation.distance(from: userLocation)
            if distance < smallestDistance {
                return true
            }
            return false
        }
    }
    
}
