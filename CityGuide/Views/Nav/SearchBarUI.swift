//
//  SearchBarUI.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-11.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct SearchBarUI: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    
    init(text: Binding<String>, isEditing: Binding<Bool>) {
        self._text = text
        self._isEditing = isEditing
    }
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(7.5)
                .padding(.horizontal, 20)
                .background(Color(.systemGray6))
                .cornerRadius(7.5)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 7.5)
                        
                        if isEditing && text.count != 0 {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 7.5)
                            }
                        }
                    }
                )
                .onTapGesture {
                    withAnimation {
                        self.isEditing = true
                    }
                }
            
            if isEditing {
                Button(action: {
                    withAnimation {
                        self.isEditing = false
                        self.text = ""
                    }
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .animation(.linear(duration: 0.25))
            }
        }
        .frame(height: 50)
        .padding(0)
    }
}

struct SearchBarUI_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarUI(text: .constant("Test"), isEditing: .constant(true))
    }
}
