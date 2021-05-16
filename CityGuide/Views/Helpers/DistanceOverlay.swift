//
//  DistanceOverlay.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-16.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct DistanceOverlay: View {
    var distance: Int
    var body: some View {
        ZStack {
            HStack{
                Text(String(convertToKm(distance)) + returnDistanceString(distance))
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(3)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(8)
            }
            .padding(6)
        }
    }
    
    func convertToKm(_ distanceInMeters: Int) -> Int {
        if distanceInMeters >= 1000 {
            return distanceInMeters / 1000
        }
        return distanceInMeters
    }
    
    func returnDistanceString(_ distanceInMeters: Int) -> String {
        if distanceInMeters >= 1000 {
            return " km"
        }
        return " m"
    }
    
}


struct DistanceOverlay_Previews: PreviewProvider {
    static var previews: some View {
        DistanceOverlay(distance: 500)
    }
}
