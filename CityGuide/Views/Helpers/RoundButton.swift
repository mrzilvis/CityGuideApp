//
//  RoundButton.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-13.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct RoundButton: View {
    @State private var showingSheet = false

    var body: some View {
        VStack{
            HStack{
                Spacer()
                Spacer()
                Button(action: {self.showingSheet.toggle()}, label: {
                    Text("Info")
                    Image(systemName: "info.circle")
                })
                    .padding(.trailing, 20)
                    .padding(.bottom, 40)
//                    .offset(y: -60) //neveikia
            }
            Spacer()
            Spacer()
            
        }.sheet(isPresented: $showingSheet) {
            SheetView()
        }
    }
}

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Spacer()
                Button("Dismiss") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .padding()
            }
        Spacer()
        Text("ARInfo")
            .padding()
            
        Spacer()
        }
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton()
    }
}
