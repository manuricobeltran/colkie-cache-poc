//
//  ProfileRemoteDataSource.swift
//  Project
//
//  Created by Manu Rico on 10/11/22.
//

import Foundation
import Combine

final class ProfileRemoteDataSource: RemoteDataSource {
    
    func getProfile() -> AnyPublisher<ProfileEntity, DataError> {
        fetch(from: URL(string: "")!)
    }
}
