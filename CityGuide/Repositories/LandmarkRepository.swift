//
//  LandmarkRepository.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-05.
//  Copyright © 2021 Zilvinas. All rights reserved.
//
import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class LandmarkRepository: ObservableObject {
    let db = Firestore.firestore()
    private let path: String  = "landmarks"
    @Published var landmarks : [LandmarkObject] = []
    
    init() {
        get()
    }
    
    func get() {
        db.collection(path)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting landmarks: \(error.localizedDescription)")
                    return
                }
                
                self.landmarks = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: LandmarkObject.self)
                } ?? []
        }
    }
    
    func add(_ landmark: LandmarkObject) {
      do {
        let newLandmark = landmark
        _ = try db.collection(path).addDocument(from: newLandmark)
      } catch {
        fatalError("Unable to add card: \(error.localizedDescription).")
      }
    }
}
