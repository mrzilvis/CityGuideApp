//
//  OnboardingStepView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-18.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct OnboardingStepView: View {
    var data: Page
    
    var body: some View {
        VStack {
            Image(data.image)
                .resizable()
                .scaledToFit()
                .padding(.bottom, 50)
            
            Text(data.title)
                .font(.system(size: 25, design: .rounded))
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
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
