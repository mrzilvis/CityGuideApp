/*
See LICENSE folder for this sample’s licensing information.

Abstract:
This class is the data source for the accommodation view.
*/
import Foundation
import UIKit
import MapKit

class AccommodationDataSource {
    let annotations: [MKAnnotation]
    
    init(landmarkListViewModel: LandmarkListViewModel) {
        let landmarkListViewModel = landmarkListViewModel
        var annotations = [MKAnnotation]()
        var annotation = MKPointAnnotation()
        landmarkListViewModel.landmarkViewModels.forEach { landmarkViewModel in
            annotation = MKPointAnnotation()
            annotation.coordinate = landmarkViewModel.landmark.locationCoordinate
            annotation.title = landmarkViewModel.landmark.name
            annotation.subtitle = landmarkViewModel.landmark.subtitle
            annotations.append(annotation)
        }
        
        self.annotations = annotations
    }
}
