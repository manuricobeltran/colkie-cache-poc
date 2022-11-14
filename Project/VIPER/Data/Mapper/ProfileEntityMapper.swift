//
//  ProfileEntityMapper.swift
//  Project
//
//  Created by Manu Rico on 9/11/22.
//

import Foundation

struct ProfileEntityMapper {
    
    static func map(_ entity: ProfileEntityCache) -> ProfileEntity {
        ProfileEntity(
            id: entity.id ?? "",
            name: entity.name ?? "",
            type: entity.type)
    }
}
