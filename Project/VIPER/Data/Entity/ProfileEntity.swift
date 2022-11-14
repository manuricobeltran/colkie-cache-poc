//
//  ProfileEntity.swift
//  Project
//
//  Created by Jordi Gámez on 30/10/22.
//

import Foundation

struct ProfileEntity: Entity {
    
    let id: String
    let name: String
    let type: UserType
}

extension ProfileEntity {
    
    enum UserType: String, Entity {
        case fan
        case artist
        case admin
    }
}
