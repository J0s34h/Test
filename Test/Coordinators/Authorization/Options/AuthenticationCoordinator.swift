//
//  AuthenticationCoordinator.swift
//  Test
//
//  Created by Yusuf Fayzullin on 22.11.2021.
//

import UIKit

class AuthenticationCoordinator: Coordinator {

    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    private let moduleFactory = AuthenticationFactory()
    private var userData = User()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showEnterNameModule()
    }
    
    private func showEnterNameModule() {
        
        let controller = moduleFactory.createAuthenticationModule()
        
        controller.completionHandler = { [weak self] value in
            guard let user = value else {
                return
            }
            
            self?.userData = user
            self?.flowCompletionHandler?(nil)   
        }
        
        navigationController.pushViewController(controller, animated: true)
    }
}
