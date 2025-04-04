//
//  LoginScreenFactory.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 04.04.2025.
//

import UIKit
import RouteComposer

struct LoginScreenFactory: Factory {
    typealias ViewController = UINavigationController
    typealias Context = Any?
    
    func build(with context: Any?) throws -> UINavigationController {
        let view = LoginViewController()
        return UINavigationController(rootViewController: view)
    }
}
