//
//  NewForm.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-06.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import SwiftUI

struct NewForm: View {
    @State var name: String = ""
    @State var rating: String = "0.0"
    @State var ratingCount: String = "0"
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var landmarkListViewModel: LandmarkListViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Name")
                    .foregroundColor(.gray)
                TextField("Enter the question", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Rating")
                    .foregroundColor(.gray)
                TextField("Enter the answer", text: $rating)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("RatingCount")
                    .foregroundColor(.gray)
                TextField("Enter the answer", text: $ratingCount)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Button(action: addLandmark) {
                Text("Add New Landmark")
                    .foregroundColor(.blue)
            }
        }
    }
    private func addLandmark() {
        let landmark = LandmarkObject(id: "1",name: name, rating: Double(rating) ?? 0.0, description: "", isFavorite: false, isFeatured: false, ratingCount: Int(ratingCount) ?? 0, category: LandmarkObject.Category.museums, imageName: "stmarylake", coordinates: LandmarkObject.Coordinates.init(latitude: 0.0, longitude: 0.0))
        landmarkListViewModel.add(landmark)
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewForm_Previews: PreviewProvider {
    static var previews: some View {
        NewForm(landmarkListViewModel: LandmarkListViewModel())
    }
}
