//
//  LoginController.swift
//  Test
//
//  Created by Yusuf Fayzullin on 22.11.2021.
//

import Foundation
import UIKit

class LoginController: UIViewController, FlowController {
    var completionHandler: ((String?) -> ())?
   
    private var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Login"
        
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
        
        let stackView = UIStackView(arrangedSubviews: [textField, nextButton])
        stackView.frame.size = CGSize(width:  200, height: 120)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.center = view.center
        
        view.addSubview(stackView)
    }
    
    @objc
    private func didPressNextButton() {
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        completionHandler?(textField.text)
    }
}



