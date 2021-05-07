//
//  LandmarkListViewModel.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-05.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import Combine

class LandmarkListViewModel: ObservableObject {
  
    @Published var landmarkRepository = LandmarkRepository()
    @Published var landmarkViewModels: [LandmarkViewModel] = []
    private var cancellables: Set<AnyCancellable> = []
    
    var categories: [String: [LandmarkViewModel]] {
        Dictionary(
            grouping: landmarkViewModels,
            by: { $0.landmark.category.rawValue }
        )
    }
    
    init() {
      landmarkRepository.$landmarks.map { landmarks in
        landmarks.map(LandmarkViewModel.init)
      }
      .assign(to: \.landmarkViewModels, on: self)
      .store(in: &cancellables)
    }
    func add(_ landmark: LandmarkObject) {
       landmarkRepository.add(landmark)
     }
}
