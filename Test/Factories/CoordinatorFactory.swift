//
//  CoordinatorFactory.swift
//  Test
//
//  Created by Yusuf Fayzullin on 22.11.2021.
//

import UIKit

class CoordinatorFactory {

    func createAuthenticationCoordinator(navigationController: UINavigationController) -> AuthenticationCoordinator {
        AuthenticationCoordinator(navigationController: navigationController)
    }
    
    func createRegistrationCoordinator(navigationController: UINavigationController) -> RegistrationCoordinator {
        RegistrationCoordinator(navigationController: navigationController)
    }
    
    func createAuthenticationChoicesCoordinator(navigationController: UINavigationController) -> AuthenticationChoiceCoordinator {
        AuthenticationChoiceCoordinator(navigationController: navigationController)
    }
    
    func createMainActivityCoordinator(navigationController: UINavigationController) -> MainActivityCoordinator {
        MainActivityCoordinator(navigationController: navigationController)
    }

    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        AppCoordinator(navigationController: navigationController)
    }
}
