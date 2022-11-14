//
//  AppDelegate+Injections.swift
//  Project
//
//  Created by Jordi Gámez on 31/10/22.
//

import Foundation
import Swinject

extension AppDelegate {
    
    func configureInjections() {
        _ = ProjectInjectorProvider.shared
            .add(ProjectModule.self)
    }
}
