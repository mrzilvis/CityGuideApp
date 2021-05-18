//
//  ARView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-05.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI
import RealityKit
import ARKit
import UIKit

//struct ARViewContainer: UIViewRepresentable {
//
////    @Binding var saved: Bool
////    @Binding var loaded: Bool
//    let coachingOverlay = ARCoachingOverlayView()
//    let arView = ARView(frame: .zero)
//    let config = ARWorldTrackingConfiguration()
//
//    func makeUIView(context: Context) -> ARView {
//        // Set up coaching overlay.
////        coachingOverlay.setupCoachingOverlay()
//        arView.addSubview(coachingOverlay)
//
//        coachingOverlay.topAnchor.constraint(equalTo: arView.topAnchor).isActive = true
//        coachingOverlay.leadingAnchor.constraint(equalTo: arView.leadingAnchor).isActive = true
//        coachingOverlay.trailingAnchor.constraint(equalTo: arView.trailingAnchor).isActive = true
//        coachingOverlay.bottomAnchor.constraint(equalTo: arView.bottomAnchor).isActive = true
//
//        coachingOverlay.goal = .tracking
//
//        coachingOverlay.session = arView.session
//
//        var anchor:ImageText._ImageText
//        anchor = try! ImageText.load_ImageText()
//        anchor.generateCollisionShapes(recursive: true)
//        arView.scene.anchors.append(anchor)
//        return arView
//    }
//
//    func updateUIView(_ uiView: ARView, context: Context) {
//
//    }
//}
struct ARViewContainer: UIViewRepresentable {
    let arView = CityGuideARView(frame: .zero)
    let config = ARWorldTrackingConfiguration()
    
    func makeUIView(context: Context) -> CityGuideARView {

//        config.planeDetection = .horizontal
//        arView.session.run(config, options: [])
//
//        var anchor:ImageText.Sculpture
//        anchor = try! ImageText.loadSculpture()
//        anchor.generateCollisionShapes(recursive: true)
//        arView.scene.anchors.append(anchor)
//
//        arView.addCoaching()
////        arView.setupGestures()
//        arView.session.delegate = arView
        return arView
    }
  func updateUIView(_ uiView: CityGuideARView, context: Context) {}

}
