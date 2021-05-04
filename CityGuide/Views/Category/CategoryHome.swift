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
    
    init() {
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    
    var body: some View {
        VStack {
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {    
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
