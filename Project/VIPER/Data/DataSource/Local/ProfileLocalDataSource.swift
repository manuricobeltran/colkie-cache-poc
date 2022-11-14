//
//  ProfileLocalDataSource.swift
//  Project
//
//  Created by Manu Rico on 10/11/22.
//

import Combine

final class ProfileLocalDataSource {
    
    private let persistenceController: PersistenceController
    private var profile: ProfileEntity?
    
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }
    
    func getProfile() -> AnyPublisher<ProfileEntity, DataError> {
        if let profile = profile {
            return Just(profile)
                .setFailureType(to: DataError.self)
                .eraseToAnyPublisher()
        } else {
            return Just(ProfileEntityCache.fetchData(using: persistenceController.container.viewContext))
                .setFailureType(to: DataError.self)
                .compactMap { $0 }
                .map { ProfileEntityMapper.map($0) }
                .handleEvents(receiveOutput: { self.profile = $0 })
                .eraseToAnyPublisher()
        }
    }
    
    func saveProfile(_ profile: ProfileEntity) {
        self.profile = profile
        
        ProfileEntityCache.createWith(
            profile,
            using: self.persistenceController.container.viewContext
        )
    }
}
