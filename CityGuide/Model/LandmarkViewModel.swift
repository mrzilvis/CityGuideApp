//
//  LandmarkViewModel.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-05.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import Combine

class LandmarkViewModel: ObservableObject, Identifiable {
    private let landmarkRepository = LandmarkRepository()
    @Published var landmark: LandmarkObject
    
    private var cancellables: Set<AnyCancellable> = []
    
    var id = ""
    
    init(landmark: LandmarkObject) {
        self.landmark = landmark
        
        $landmark
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    func update(landmark: LandmarkObject) {
      landmarkRepository.update(landmark)
    }
}
