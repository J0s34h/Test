//
//  ViewController.swift
//  Test
//
//  Created by Yusuf Fayzullin on 22.11.2021.
//

import UIKit

class AuthenticationController: UIViewController, FlowController {
    
    var completionHandler: ((User?) -> ())?
    
    private var loginTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Login"
        
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Password"
        
        return textField
    }()
    
    private let nextButton: UIButton = {
        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(didPressNextButton), for: .touchUpInside)
        
        return nextButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    private func addSubviews() {
        
        title = "EnterName"
        view.backgroundColor = .systemBackground
        
        let stackView = UIStackView(arrangedSubviews: [loginTextField, passwordTextField, nextButton])
        stackView.frame.size = CGSize(width:  200, height: 120)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.center = view.center
        
        view.addSubview(stackView)
    }
    
    @objc
    private func didPressNextButton() {
        guard let login = loginTextField.text, !login.isEmpty else {
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            return
        }
        
        completionHandler?(User(name: login, password: password))
    }
}
