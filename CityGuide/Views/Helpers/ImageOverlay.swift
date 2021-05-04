//
//  ImageOverlay.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-03.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct ImageOverlay: View {
    var landmark: LandmarkObject
    var body: some View {
        ZStack {
            Text(landmark.name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            .padding(6)
        }
    }
}

struct ImageOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ImageOverlay(landmark: ModelData().landmarkObjects[0])
    }
}
