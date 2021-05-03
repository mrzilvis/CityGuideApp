//
//  CategoryRow.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-02.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
//    var categoryName: String
//    var items: [LandmarkObject]
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationBarTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
//    static var landmarkObjects = ModelData().landmarkObjects
    
    static var previews: some View {
        CategoryHome()
        .environmentObject(ModelData())
    }
}
