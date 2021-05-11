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
//        let sphere = MeshResource.generateSphere(radius: 1)
//        let sphereEntity = ModelEntity(mesh: sphere)
//        sphereEntity.name = "SPHERE"
//        sphereEntity.setParent(anchor)
        arView.scene.anchors.append(anchor)
        return arView
    }
    
//    fileprivate func saveWorldMap() {
//
//        arView.session.getCurrentWorldMap { (worldMap, _) in
//
//            if let map: ARWorldMap = worldMap {
//
//                let data = try! NSKeyedArchiver.archivedData(withRootObject: map,
//                                                      requiringSecureCoding: true)
//
//                let savedMap = UserDefaults.standard
//                savedMap.set(data, forKey: "WorldMap")
//                savedMap.synchronize()
//            }
//        }
//    }
//    fileprivate func loadWorldMap() {
//
//        let storedData = UserDefaults.standard
//
//        if let data = storedData.data(forKey: "WorldMap") {
//
//            if let unarchiver = try? NSKeyedUnarchiver.unarchivedObject(
//                                   ofClasses: [ARWorldMap.classForKeyedUnarchiver()],
//                                        from: data),
//               let worldMap = unarchiver as? ARWorldMap {
//                    config.initialWorldMap = worldMap
//                    arView.session.run(config)
//            }
//        }
//    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        guard let entity = uiView.scene.findEntity(named: "SPHERE")
            else { return }
        
//        if saved{
//            self.saveWorldMap()
//        }
//        if loaded{
//            self.loadWorldMap()
//        }
    }
}
