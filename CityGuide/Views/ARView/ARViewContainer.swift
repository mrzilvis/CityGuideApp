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
    
    @Binding var saved: Bool
    @Binding var loaded: Bool
    
    
    let arView = ARView(frame: .zero)
    let config = ARWorldTrackingConfiguration()
    
    func makeUIView(context: Context) -> ARView {
        var anchor:ImageText._ImageText
        anchor = try! ImageText.load_ImageText()
        anchor.generateCollisionShapes(recursive: true)
        arView.scene.anchors.append(anchor)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {

    }
}
