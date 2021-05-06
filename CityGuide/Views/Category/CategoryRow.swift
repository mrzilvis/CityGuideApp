//
//  CategoryRow.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-03.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [LandmarkViewModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    Section {
                        ForEach(items) { landmarkViewModel in
                            NavigationLink(destination: LandmarkDetail(landmarkViewModel: landmarkViewModel)){
                                CategoryItem(landmarkViewModel: landmarkViewModel)
                            }
                        }
                    }
                }.animation(.default)
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarkListViewModel = LandmarkListViewModel()
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarkListViewModel.landmarkViewModels[0].landmark.category.rawValue,
            items: Array(arrayLiteral: landmarkListViewModel.landmarkViewModels[0])
        )
    }
}
