//
//  GetProfileInteractor.swift
//  Project
//
//  Created by Jordi Gámez on 30/10/22.
//

import Combine

//sourcery: AutoMockable
protocol GetProfileInteractor {
    func execute() -> AnyPublisher<Profile, DataError>
}

class GetProfileInteractorDefault {
    
    private let profileRepository: ProfileRepository
    
    init(profileRepository: ProfileRepository) {
        self.profileRepository = profileRepository
    }
}

extension GetProfileInteractorDefault: GetProfileInteractor {

    func execute() -> AnyPublisher<Profile, DataError> {
        profileRepository.getProfile()
            .map { ProfileMapper.map($0) }
            .eraseToAnyPublisher()
    }
}
