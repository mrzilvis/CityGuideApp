//
//  OnboardingButton.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-18.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct OnboardingButton: View {
    @State private var onboardingDone = false
    var data = tabs
    var body: some View {
        NavigationLink(destination: OnboardingViewPure(data: tabs, doneFunction: {
            self.onboardingDone = true
        })){
            Button(action: {}, label: {
                Text("Info")
                Image(systemName: "info.circle")
            })
                .padding(.trailing, 20)
                .padding(.bottom, 40)
        }
    }
}

struct OnboardingButton_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingButton()
    }
}
