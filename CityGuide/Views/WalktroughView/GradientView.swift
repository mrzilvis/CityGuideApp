//
//  GradientView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-18.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color(.white),
            Color(.gray)
        ]
        ), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
