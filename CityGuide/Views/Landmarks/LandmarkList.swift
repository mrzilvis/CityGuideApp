//
//  LandmarkList.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-02.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [LandmarkObject] {
        modelData.landmarkObjects.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            List {
                Toggle(isOn: self.$showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(self.filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmarkObject: landmark)) {
                        LandmarkRow(landmarkObject: landmark)
                    }
                }
            }
        .navigationBarTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    
    static var previews: some View {
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//            .previewDisplayName(deviceName)
//        }
        LandmarkList()
            .environmentObject(ModelData())
    }
}
