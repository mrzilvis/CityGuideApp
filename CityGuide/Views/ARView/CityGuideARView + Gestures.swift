//
//  CityGuideARView + Gestures.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-25.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import RealityKit
import SceneKit

extension CityGuideARView {
    func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapGesture.delegate = self
        self.addGestureRecognizer(tapGesture)
    }

    @IBAction func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        guard gestureRecognizer.state == .ended else {
            return
        }
        if self.focusEntity.state != .initializing,
           self.focusEntity.onPlane {
            
            self.hitPoints.append(self.focusEntity.position(relativeTo: nil))
        }
    }
}
