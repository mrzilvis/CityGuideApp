//
//  LandmarkAnnotation.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-04.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import Foundation
import MapKit
import UIKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(localLandmark: LocalLandmark) {
        self.title = localLandmark.name
        self.coordinate = localLandmark.coordinate
    }
}
