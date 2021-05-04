//
//  RatingView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-04.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct RatingSelectView: View {
    @Binding var rating: Double
    @Binding var ratingCount: Int
    
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    @State var isTapped = false
    @State var originalRating = 0.0
    @State var ratingSelected = 0
    
    var body: some View {
        
        HStack {
            ForEach(1..<maximumRating + 1) {
                number in
                self.image(for: number)
                    .foregroundColor(number > Int(self.ratingSelected) ? self.offColor : self.onColor)
                    .onTapGesture {
                        if self.isTapped != true {
                            self.ratingCount += 1
                            self.isTapped = true
                            self.originalRating = self.rating
                        }
                        self.ratingSelected = number
                        self.rating = (((self.originalRating * Double(self.ratingCount)) + Double(number)) / Double(self.ratingCount)).round(to: 1)
                }
            }
//            Text(String(ratingCount) + " reviews")
//                .font(.caption)
//                .foregroundColor(.secondary)
//                .padding(.leading)
        }
    }
    
    func image(for number: Int) -> Image {
        if number > Int(ratingSelected) {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingSelectView_Previews: PreviewProvider {
    static var previews: some View {
        RatingSelectView(rating: .constant(4), ratingCount: .constant(266))
    }
}
