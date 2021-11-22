//
//  MainActivityCoordinator.swift
//  Test
//
//  Created by Yusuf Fayzullin on 22.11.2021.
//

import UIKit

class MainActivityCoordinator: Coordinator {

    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    private let moduleFactory = MainActivityFactory()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showMainActivity()
    }

    private func showMainActivity() {

        let controller = moduleFactory.createMainActivityModule()
        
        controller.completionHandler = { _ in
            (controller.view.window?.windowScene?.delegate as? SceneDelegate)?.appCoordinator.start()
        }

        navigationController.setViewControllers([controller], animated: true)
    }
}
