//
//  RegistrationController.swift
//  Test
//
//  Created by Yusuf Fayzullin on 22.11.2021.
//

import UIKit

class RegistrationModuleFactory {
    
    func createLoginModule() -> LoginController {
        LoginController()
    }
    
    func createEnterPasswordModule() -> PasswordController {
        PasswordController()
    }

}
