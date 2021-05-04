//
//  RatingView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-04.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Double
    @Binding var ratingCount: Int
    
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            ForEach(1..<maximumRating + 1) {
                number in
                self.image(for: number)
                    .foregroundColor(number > Int(self.rating) ? self.offColor : self.onColor)
                
            }
        
        Text(String(ratingCount) + " reviews")
            .font(.caption)
            .foregroundColor(.secondary)
            .padding(.leading)
        }
    }
    
    func image(for number: Int) -> Image {
        if number > Int(rating) {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4), ratingCount: .constant(500))
    }
}
