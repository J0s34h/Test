//
//  AuthorizationOptionsController.swift
//  Test
//
//  Created by Yusuf Fayzullin on 22.11.2021.
//

import UIKit

class AuthorizationOptionsController: UIViewController, FlowController {
    var completionHandler: ((Bool?) -> ())?
    
    lazy var signInButton: UIButton = {
        let button = UIButton(type: .system)
    
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(didPressSignInButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
    
        button.setTitle("Sign Up", for: .normal)
        button.addTarget(self, action: #selector(didPressSignOutButton), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubViews()
    }
    
    func addSubViews() {
        let stackView = UIStackView(arrangedSubviews: [signInButton, signUpButton])
        stackView.frame.size = CGSize(width:  200, height: 120)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.center = view.center
        
        view.addSubview(stackView)
    }
    
    @objc
    func didPressSignInButton() {
        completionHandler?(true)
    }
    
    @objc
    func didPressSignOutButton() {
        completionHandler?(false)
    }
}
