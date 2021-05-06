//
//  TextView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-07.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct TextView: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textView.textAlignment = .justified
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
