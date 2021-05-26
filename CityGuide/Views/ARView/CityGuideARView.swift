//
//  CityGuideARView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-17.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import Foundation
import ARKit
import RealityKit
import FocusEntity

class CityGuideARView: ARView, ARSessionDelegate {
    var dataModel: ARModel
    let coachingOverlay = ARCoachingOverlayView()
    
    public var focusEntity : FocusEntity!
    
    var pathEntity = RKPathEntity(path: [],
                                  width: 0.35,
                                  materials: [UnlitMaterial.init(color: .blue)])
    
    var hitPoints = [simd_float3]() {
        didSet {
            self.pathEntity.pathPoints = self.hitPoints
        }
    }
    
    required init(frame frameRect: CGRect, dataModel: ARModel) {
        self.dataModel = dataModel
        super.init(frame: frameRect)
        
        self.session.delegate = self

        runNonLiDARConfig()
                
        let worldAnchor = AnchorEntity() //point 0,0,0
        self.scene.addAnchor(worldAnchor)
        worldAnchor.addChild(pathEntity)

        let anotherAnchor = AnchorEntity()
        var anchor:ImageText._ImageText
        anchor = try! ImageText.load_ImageText()
        anchor.generateCollisionShapes(recursive: true)
        self.scene.addAnchor(anotherAnchor)
        anotherAnchor.addChild(anchor)
        
        self.addCoaching()
        self.setupGestures()
        
        do {
          let onColor: MaterialColorParameter = try .texture(.load(named: "Add"))
          let offColor: MaterialColorParameter = try .texture(.load(named: "Open"))
          self.focusEntity = FocusEntity(
            on: self,
            style: .colored(
              onColor: onColor, offColor: offColor,
              nonTrackingColor: offColor
            )
          )
        } catch {
            self.focusEntity = FocusEntity(on: self, focus: .classic)
          print("Unable to load plane textures")
          print(error.localizedDescription)
        }
        
//        self.addScene()
    }
    
    func runNonLiDARConfig(){
        guard ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) else {
            fatalError("People occlusion is not supported on this device.")
        }
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        configuration.frameSemantics.insert(.personSegmentationWithDepth)
        
        self.session.run(configuration)
    }
    
    
    //required function.
    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc required dynamic init(frame frameRect: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }

    func addScene(){
        var anchor:ImageText._ImageText
        anchor = try! ImageText.load_ImageText()
        anchor.generateCollisionShapes(recursive: true)
        
        self.scene.anchors.append(anchor)
        
        self.session.delegate = self
    }
}
