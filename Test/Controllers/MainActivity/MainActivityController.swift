//
//  MainActivityController.swift
//  Test
//
//  Created by Yusuf Fayzullin on 22.11.2021.
//

import UIKit

class MainActivityController: UIViewController, FlowController {

    var completionHandler: ((Void?) -> Void)?
    
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
        
        title = "Main Activity"
        view.backgroundColor = .systemBackground
        
        let stackView = UIStackView(arrangedSubviews: [nextButton])
        stackView.frame.size = CGSize(width:  200, height: 120)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.center = view.center
        
        view.addSubview(stackView)
    }
    
    @objc
    private func didPressNextButton() {
        completionHandler?(nil)
    }
}
