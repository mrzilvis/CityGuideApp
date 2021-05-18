//
//  TabDetailsView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-18.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI
import SSSwiftUIGIFView

struct TabDetailsView: View {
    let index: Int
    
    var body: some View {
        VStack {
//            Image(tabs[index].image)
            SwiftUIGIFPlayerView(gifName: "Image")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 560)
            
            Text(tabs[index].title)
                .font(.title)
            .bold()
            
            Text(tabs[index].text)
                .padding()
        }
        .foregroundColor(.white)
    }
}

struct TabDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TabDetailsView(index: 0)
    }
}
