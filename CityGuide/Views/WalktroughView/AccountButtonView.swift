//
//  AccountButtonView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-18.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct AccountButtonView: View {
    @Binding var isWalktroughViewShowing: Bool
    
    var body: some View {
        Button(action: {
            self.dismiss()
        }, label: {
            Text("Dismiss")
                .foregroundColor(.white)
            .underline()
        })
    }
    func dismiss() {
        withAnimation {
            isWalktroughViewShowing.toggle()
        }
    }
}

struct AccountButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AccountButtonView(isWalktroughViewShowing: .constant(true))
    }
}
