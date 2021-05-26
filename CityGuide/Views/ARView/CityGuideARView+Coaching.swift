//
//  CityGuideARView+Coaching.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-17.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import ARKit
import RealityKit
import UIKit
import Foundation

extension CityGuideARView: ARCoachingOverlayViewDelegate {
  func addCoaching() {
    let coachingOverlay = ARCoachingOverlayView()
    
    coachingOverlay.autoresizingMask = [
      .flexibleWidth, .flexibleHeight
    ]
    
    self.addSubview(coachingOverlay)
    
    // Set the Augmented Reality goal
    coachingOverlay.goal = .anyPlane
    // Set the ARSession
    coachingOverlay.session = self.session
    // Set the delegate for any callbacks
    coachingOverlay.delegate = self
    
    self.addSubview(self.coachingOverlay)
  }
    
    func coachingOverlayViewDidDeactivate(
      _ coachingOverlayView: ARCoachingOverlayView
    ) {
//        self.addScene()
    }
}
