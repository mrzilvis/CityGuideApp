//
//  ARContentView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-10.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct ARContentView: View {
    @State private var saver = false
    @State private var loader = false
    
    var body: some View {
        VStack {
            ZStack {
                ARViewContainer(saved: $saver, loaded: $loader)
            }
        }
    }
}

struct ARContentView_Previews: PreviewProvider {
    static var previews: some View {
        ARContentView()
    }
}
