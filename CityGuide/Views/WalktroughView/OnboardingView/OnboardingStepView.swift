//
//  OnboardingStepView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-18.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI
import SSSwiftUIGIFView

struct OnboardingStepView: View {
    var data: Page
    
    var body: some View {
        VStack {
            Image(data.image)
                .resizable()
                .scaledToFit()
                .padding(.bottom, 50)
                .cornerRadius(8)
                .frame(width: 300, height: 300)
            
            Text(data.title)
                .font(.system(size: 25, design: .rounded))
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .multilineTextAlignment(.center)
            
            Text(data.text)
                .font(.system(size: 17, design: .rounded))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
        }
    .padding()
    }
}

//struct OnboardingStepView_Previews: PreviewProvider {
//    static var data = Page.data[0]
//    static var previews: some View {
//        OnboardingStepView(data: data)
//    }
//}
