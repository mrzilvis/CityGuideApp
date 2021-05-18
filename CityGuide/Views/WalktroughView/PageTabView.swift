//
//  PageTabView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-18.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct PageTabView: View {
    @Binding var selection: Int
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(tabs.indices, id: \.self) { index in
                TabDetailsView(index: index)
            }
        }
    
    }
}

struct PageTabView_Previews: PreviewProvider {
    static var previews: some View {
        PageTabView(selection: .constant(0))
    }
}
