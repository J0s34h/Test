//
//  FlowController.swift
//  Test
//
//  Created by Yusuf Fayzullin on 22.11.2021.
//

import Foundation

protocol FlowController {
    associatedtype T
    var completionHandler: ((T) -> Void)? { get set }
}
