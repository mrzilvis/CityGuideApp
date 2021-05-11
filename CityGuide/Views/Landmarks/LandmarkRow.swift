//
//  LandmarkRow.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-02.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmarkObject: LandmarkObject
    
    var body: some View {
        HStack {
            landmarkObject.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmarkObject.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarkObjects = ModelData().landmarkObjects
    
    static var previews: some View {
        Group {
            LandmarkRow(landmarkObject: landmarkObjects[0])
            LandmarkRow(landmarkObject: landmarkObjects[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
        
    }
}
