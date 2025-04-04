//
//  UIViewController.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 04.04.2025.
//

import UIKit
import RouteComposer

extension UIViewController {
    
    static let router: Router = {
        var defaultRouter = GlobalInterceptorRouter(router: DefaultRouter())
        defaultRouter.addGlobal(NavigationDelayingInterceptor(strategy: .wait))
        return defaultRouter
    }()
    
    var router: Router {
        UIViewController.router
    }
}
