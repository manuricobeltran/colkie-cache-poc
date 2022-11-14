//
//  MockProfilePresenter.swift
//  Project
//
//  Created by Jordi Gámez on 31/10/22.
//

import Foundation

class MockProfilePresenter: ProfilePresenter {
    
    @Published var profile: Profile = Profile(id: "1", name: "Aitna", type: .artist)
    @Published var name: String = "Manu"
}

extension MockProfilePresenter {
    
    func loadProfile() {
        // Intentionally empty
    }
}
