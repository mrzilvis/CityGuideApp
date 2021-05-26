//
//  ARModel.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-25.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import Combine
import RealityKit
import SwiftUI

final class ARModel: ObservableObject {
    static var shared = ARModel()

    @Published var showingAlert = false {
        didSet{
            print("showingAlert:", showingAlert)
        }
    }
    @Published var arView : CityGuideARView!
    
    init(){
       arView = CityGuideARView(frame: .zero, dataModel: self)
    }
}
