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
    @State private var searchText : String = ""
    
    var filteredLandmarks: [LandmarkObject] {
        modelData.landmarkObjects.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        VStack {
            SearchBar(text: self.$searchText)
            ScrollView {
                VStack {
                    //                Toggle(isOn: self.$showFavoritesOnly) {
                    //                    Text("Favorites only")
                    //                }
                    
                    ForEach(self.filteredLandmarks.filter {
                        self.searchText.isEmpty ? true : $0.name.lowercased().contains(self.searchText.lowercased())
                    }) { landmark in
                        NavigationLink(destination: LandmarkDetail(landmarkObject: landmark)
                            .environmentObject(self.modelData))
                             {
                                LandmarkCard(landmark: landmark)
                                    .environmentObject(self.modelData)
                            }
                        .buttonStyle(PlainButtonStyle())
                        }
                }
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
