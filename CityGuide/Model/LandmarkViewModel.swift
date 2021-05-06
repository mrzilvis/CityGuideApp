//
//  LandmarkViewModel.swift
//  CityGuide
//
//  Created by Zilvinas on 2021-05-05.
//  Copyright © 2021 Zilvinas. All rights reserved.
//

import Combine

class LandmarkViewModel: ObservableObject, Identifiable {

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
}
