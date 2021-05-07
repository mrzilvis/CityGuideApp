//
//  CircleImage.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-03.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
        .resizable()
        .aspectRatio(contentMode: .fill)
            .frame(height: 200)
        .clipped()
        .padding(2)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("stmarylake"))
    }
}
