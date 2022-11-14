//
//  ProfileConfigurator.swift
//  Project
//
//  Created by Jordi Gámez on 31/10/22.
//

import SwiftUI

struct ProfileConfigurator {
    
    private var injector: Injector {
        ProjectInjectorProvider.shared.injector
    }
    
    init() {
        // Intentionally empty
    }
    
    func getViewController() -> UIViewController {
        let getProfileInteractor = injector.instanceOf(GetProfileInteractor.self)
        let profileRouter = ProfileRouterDefault()
        let presenter = ProfilePresenterDefault(getProfileInteractor: getProfileInteractor,
                                                profileRouter: profileRouter)
        let view = ProfileView<ProfilePresenterDefault>().environmentObject(presenter)
        let viewController = UIHostingController(rootView: view)
        profileRouter.viewController = viewController
        
        return viewController
    }
}
