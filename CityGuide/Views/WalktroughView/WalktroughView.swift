////
////  WalktroughView.swift
////  CityGuide
////
////  Created by Zilvinas on 2021-05-18.
////  Copyright © 2021 Zilvinas. All rights reserved.
////
//
//import SwiftUI
//
//
//struct WalktroughView: View {
//    @State private var onBoardingDone = false
//    @Binding var isWalkthroughViewShowing: Bool
//    
//    var body: some View {
//        ZStack {
//            GradientView()
//            VStack {
//                PageTabView(selection: $selection)
//                ButtonView(selection: $selection)
//                AccountButtonView(isWalktroughViewShowing: $isWalkthroughViewShowing)
//            }
//        }
//        .transition(.move(edge: .bottom))
//    }
//}
//
//struct WalktroughView_Previews: PreviewProvider {
//    static var previews: some View {
//        WalktroughView(isWalkthroughViewShowing: .constant(true))
//    }
//}
