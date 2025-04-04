//
//  MainRouter.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 04.04.2025.
//

import UIKit
import RouteComposer

final class MainRouter {
    let router: Router
    let window: UIWindow?
    
    init(router: Router, window: UIWindow?) {
        self.router = router
        self.window = window
    }
    
    func showRootScreen() {
        let startVC = LoginViewController()
        window?.rootViewController = startVC
    }
}
