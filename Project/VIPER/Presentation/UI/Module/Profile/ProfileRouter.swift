//
//  ProfileRouter.swift
//  Project
//
//  Created by Jordi Gámez on 31/10/22.
//

import UIKit

//sourcery: AutoMockable
protocol ProfileRouter {
    
}

class ProfileRouterDefault {
    
    var viewController: UIViewController?
}

extension ProfileRouterDefault: ProfileRouter {
    
}
