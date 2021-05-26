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

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> CityGuideARView {
//        let arView = CityGuideARView(frame: .zero)
//        let config = ARWorldTrackingConfiguration()
//
//        let session = ARSession()
//        arView.session = session
//
//        config.planeDetection = [.horizontal, .vertical]
////        config.frameSemantics.insert(.personSegmentationWithDepth)
//        arView.session.run(config)
//
//        arView.addCoaching()
//        //arView.addScene()
//        arView.session.delegate = arView
//        return arView
        return ARModel.shared.arView
    }
    
    func updateUIView(_ uiView: CityGuideARView, context: Context) {

    }
}
