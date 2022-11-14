//
//  Profile.swift
//  Project
//
//  Created by Jordi Gámez on 30/10/22.
//

import Foundation

struct Profile {
    
    let id: String
    let name: String
    let type: UserType
    
    var isArtist: Bool {
        type == .artist
    }
}

extension Profile {
    
    enum UserType {
        case fan
        case artist
        case admin
    }
}

extension Profile {
    
    static func empty() -> Profile {
        .init(id: "", name: "", type: .fan)
    }
}
