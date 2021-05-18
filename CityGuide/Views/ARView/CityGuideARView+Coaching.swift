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
    self.coachingOverlay.delegate = self
    self.coachingOverlay.session = self.session
    self.coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    // MARK: CoachingGoal
    self.coachingOverlay.goal = .horizontalPlane
    self.coachingOverlay.goal = .tracking
    
    self.addSubview(self.coachingOverlay)
  }
}
