//
//  LandmarkList.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-02.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @ObservedObject var landmarkListViewModel = LandmarkListViewModel()
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            SearchBar(text: self.$searchText)
            ScrollView {
                VStack {
                    ForEach(landmarkListViewModel.landmarkViewModels.filter {
                        self.searchText.isEmpty ? true : $0.landmark.name.lowercased().contains(self.searchText.lowercased())
                    }) { landmarkViewModel in
                        NavigationLink(destination: LandmarkDetail(landmarkViewModel: landmarkViewModel))
                             {
                                LandmarkCard(landmarkViewModel: landmarkViewModel)
                            }
                        .buttonStyle(PlainButtonStyle())
                    }
                }.navigationBarTitle(LocalizedStringKey("Objects"))
            }
        }
    }
}
