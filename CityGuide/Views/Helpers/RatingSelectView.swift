//
//  RatingView.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-04.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

struct RatingSelectView: View {
    var landmarkViewModel: LandmarkViewModel
    @Binding var rating: Double
    @Binding var ratingCount: Int
    
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    @State var ratingSelected: Int = 0
    @State var initialRating: Double = 0.0
    
    var body: some View {
        
        HStack {
            ForEach(1..<maximumRating + 1) {
                number in
                self.image(for: number)
                    .foregroundColor(number > Int(self.ratingSelected) ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.ratingSelected = number
                        if self.returnUserRating() > 0 {
                            return
                        } else {
                            self.setNewRating(self.countNewRating(self.landmarkViewModel.landmark.rating, self.landmarkViewModel.landmark.ratingCount, true, number), true)
                        }
                        self.ratingSelected = number
                }
            }
        }
    }
    
    func returnUserRating() -> Int {
        var ratingGiven = 0

        landmarkViewModel.landmark.ratedByUserIds.map { userRating in
            userRating.map{ values in
                if values.userId == Auth.auth().currentUser?.uid ?? "" {
                    ratingGiven = values.ratingGiven
                }
            }
        }
        return ratingGiven
    }
    
    func countNewRating(_ rating: Double, _ ratingCount: Int, _ increment: Bool, _ starsSelected: Int) -> Double {
        var ratingCount = ratingCount
        if increment {
            ratingCount += 1
        }
        return ((rating * Double(ratingCount) + Double(starsSelected)) / Double(ratingCount)).round(to: 1)
    }
    
    func image(for number: Int) -> Image {
        if returnUserRating() > 0 {
            self.ratingSelected = returnUserRating()
        }
        if number > Int(self.ratingSelected) {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    private func setNewRating(_ rating: Double, _ incrementRating: Bool) {
        var updatedLandmark = landmarkViewModel.landmark
        updatedLandmark.rating = rating
        if incrementRating {
            updatedLandmark.ratingCount += 1
            let userRating = LandmarkObject.UserRating(userId: Auth.auth().currentUser?.uid ?? "", ratingGiven: self.ratingSelected)
            updatedLandmark.ratedByUserIds?.append(userRating)
        }
        update(landmark: updatedLandmark)
    }
    
    func update(landmark: LandmarkObject) {
        landmarkViewModel.update(landmark: landmark)
    }
}
