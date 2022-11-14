//
//  ProfileRepository.swift
//  Project
//
//  Created by Jordi Gámez on 31/10/22.
//

import Foundation
import Combine

//sourcery: AutoMockable
protocol ProfileRepository {
    func getProfile() -> AnyPublisher<ProfileEntity, DataError>
}

class ProfileRepositoryDefault {
    
    private let local: ProfileLocalDataSource
    private let remote: ProfileRemoteDataSource
    
    init(
        localDataSource: ProfileLocalDataSource,
        remoteDataSource: ProfileRemoteDataSource
    ) {
        local = localDataSource
        remote = remoteDataSource
    }
}

extension ProfileRepositoryDefault: ProfileRepository {
    
    func getProfile() -> AnyPublisher<ProfileEntity, DataError> {
        Publishers.Merge(
            local
                .getProfile(),
            remote
                .getProfile()
                .handleEvents(receiveOutput: { self.local.saveProfile($0) })
        )
        .eraseToAnyPublisher()
    }
}
