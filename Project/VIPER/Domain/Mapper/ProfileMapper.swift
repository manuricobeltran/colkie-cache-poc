//
//  ProfileMapper.swift
//  Project
//
//  Created by Jordi Gámez on 30/10/22.
//

import Foundation

struct ProfileMapper {
    
    static func map(_ entity: ProfileEntity) -> Profile {
        Profile(id: entity.id,
                name: entity.name,
                type: Self.mapType(type: entity.type))
    }
}

private extension ProfileMapper {
    
    static func mapType(type: ProfileEntity.UserType) -> Profile.UserType {
        switch type {
        case .fan:
            return .fan
        case .artist:
            return .artist
        case .admin:
            return .admin
        }
    }
}
