//
//  ModelData.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-02.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ModelData: ObservableObject {
    @Published var landmarkObjects = [LandmarkObject]()
    private var db = Firestore.firestore()
    
    var features: [LandmarkObject] {
        landmarkObjects.filter { $0.isFeatured }
    }
    
    var categories: [String: [LandmarkObject]] {
        Dictionary(
            grouping: landmarkObjects,
            by: { $0.category.rawValue }
        )
    }
}
