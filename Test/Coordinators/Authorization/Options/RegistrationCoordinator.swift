//
//  RegistrationCoordinator.swift
//  Test
//
//  Created by Yusuf Fayzullin on 22.11.2021.
//

import UIKit

class RegistrationCoordinator: Coordinator {

    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    private let moduleFactory = RegistrationModuleFactory()
    private var userData = User()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showEnterNameModule()
    }

    private func showEnterNameModule() {

        let controller = moduleFactory.createLoginModule()

        controller.completionHandler = { [weak self] value in
            self?.userData.name = value
            self?.showEnterPasswordModule()
        }

        navigationController.pushViewController(controller, animated: true)
    }

    private func showEnterPasswordModule() {

        let controller = moduleFactory.createEnterPasswordModule()

        controller.completionHandler = { [weak self] value in
            self?.userData.password = value
            self?.flowCompletionHandler?(nil)
        }

        navigationController.pushViewController(controller, animated: true)
    }
}
