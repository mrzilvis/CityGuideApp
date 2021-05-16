//
//  PlaceListView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-16.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct PlaceListView: View {
    let landmarkViewModels: [LandmarkViewModel]
    var onTap: () -> ()
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                EmptyView()
            }.frame(width: UIScreen.main.bounds.size.width, height: 60)
                .background(Color.gray)
                .gesture(TapGesture().onEnded(self.onTap))
            List {
                ForEach(self.landmarkViewModels, id: \.id) { landmarkViewModel in
                    VStack(alignment: .leading) {
                        Text(landmarkViewModel.landmark.name)
                            .fontWeight(.bold)
                        Text(landmarkViewModel.landmark.subtitle)
                    }
                }
            }.animation(nil)
        }.cornerRadius(10)
    }
}

//struct PlaceListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceListView()
//    }
//}
