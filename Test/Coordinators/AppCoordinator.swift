//
//  AppCoordinator.swift
//  Test
//
//  Created by Yusuf Fayzullin on 22.11.2021.
//

import UIKit

class AppCoordinator: Coordinator {

    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    private var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showChoiceFlow()
    }
    
    private func showChoiceFlow() {
        let authenticationChoices = CoordinatorFactory().createAuthenticationChoicesCoordinator(navigationController: navigationController)

        childCoordinators.append(authenticationChoices)

        authenticationChoices.flowCompletionHandler = { [weak self] value in
            guard let isAuthenticationFlow = value as? Bool else {
                return
            }
            
            if isAuthenticationFlow {
                self?.showAuthenticationFlow()
            } else {
                self?.showRegistrationFlow()
            }
            
        }

        authenticationChoices.start()
    }

    private func showRegistrationFlow() {

        let registrationCoordinator = CoordinatorFactory().createRegistrationCoordinator(navigationController: navigationController)

        childCoordinators.append(registrationCoordinator)

        registrationCoordinator.flowCompletionHandler = { [weak self] value in
            self?.showMainActivity()
        }

        registrationCoordinator.start()
    }
    
    private func showAuthenticationFlow() {

        let authenticationCoordinator = CoordinatorFactory().createAuthenticationCoordinator(navigationController: navigationController)

        childCoordinators.append(authenticationCoordinator)

        authenticationCoordinator.flowCompletionHandler = { [weak self] value in
            self?.showMainActivity()
        }

        authenticationCoordinator.start()
    }

    private func showMainActivity() {
        let mainActivityCoordinator = CoordinatorFactory().createMainActivityCoordinator(navigationController: navigationController)

        mainActivityCoordinator.flowCompletionHandler = { [weak self] value in
            print("Main activity flow completition")
            self?.showChoiceFlow()
        }

        mainActivityCoordinator.start()
    }
}
