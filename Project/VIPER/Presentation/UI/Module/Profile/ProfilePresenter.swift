//
//  ProfilePresenter.swift
//  Project
//
//  Created by Jordi Gámez on 31/10/22.
//

import Foundation
import Combine

protocol ProfilePresenter: ObservableObject {
    var profile: Profile { get set }
    var name: String { get set }
    func loadProfile()
}

class ProfilePresenterDefault {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var profile: Profile = Profile.empty()
    @Published var name = "Manu"
    
    private let getProfileInteractor: GetProfileInteractor
    private let profileRouter: ProfileRouter
    
    init(getProfileInteractor: GetProfileInteractor,
         profileRouter: ProfileRouter) {
        self.getProfileInteractor = getProfileInteractor
        self.profileRouter = profileRouter
    }
}

extension ProfilePresenterDefault: ProfilePresenter {
    
    @MainActor
    func loadProfile() {
                
        getProfileInteractor.execute()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] in
                    self?.profile = $0
                })
            .store(in: &cancellables)
        
//        Task {
//            profile = await getProfileInteractor.execute()
//        }
    }
}
