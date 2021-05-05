//
//  MapUIView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-04.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapUIView
    
    init(_ control: MapUIView){
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        // MARK - Zoom into local region
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let placemark = MKPlacemark(coordinate: view.annotation!.coordinate, addressDictionary: nil)
        print(placemark)
        let mapItem = MKMapItem(placemark: placemark)
        let launchOptions = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeTransit]
//        self.title = title
//        mapItem.name = title
        mapItem.openInMaps(launchOptions: launchOptions)
    }
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier:
//                                                                      MKMapViewDefaultAnnotationViewReuseIdentifier,
//                                                                      for: annotation) as? MKMarkerAnnotationView {
//            if annotation is MKPointAnnotation {
//                annotationView.glyphText = "H"
//                annotationView.markerTintColor = nil
//            }
//
//            return annotationView
//        }
//
//        return nil
//    }
}
    

struct MapUIView: UIViewRepresentable {
    let localLandmarks: [LocalLandmark]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapUIView>) {
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.localLandmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
        
        let dataSource = AccommodationDataSource()
        mapView.addAnnotations(dataSource.annotations)
        mapView.showAnnotations(dataSource.annotations, animated: false)
    }
}
