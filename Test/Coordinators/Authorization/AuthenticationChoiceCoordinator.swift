//
//  AuthenticationChoiceCoordinator.swift
//  Test
//
//  Created by Yusuf Fayzullin on 22.11.2021.
//

import UIKit

class AuthenticationChoiceCoordinator: Coordinator {

    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    private let moduleFactory = AuthorizationOptionsFactory()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showAuthenticationChoices()
    }

    private func showAuthenticationChoices() {

        let controller = moduleFactory.createAuthorizationOptionsModule()

        controller.completionHandler = { [weak self] value in
            self?.flowCompletionHandler?(value)
        }

        navigationController.setViewControllers([controller], animated: true)
    }
}
