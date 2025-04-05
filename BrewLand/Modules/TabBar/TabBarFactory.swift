//
//  TabBarFactory.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 05.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RouteComposer

struct TabBarFactory: ContainerFactory {
    
    typealias ViewController = TabBarViewController
    typealias Context = Any?
    
    func build(with context: Any?, integrating coordinator: ChildCoordinator) throws -> TabBarViewController {
        let view = TabBarViewController()
        view.viewControllers = try coordinator.build()
        
        let interactor = TabBarInteractor()
        let router = TabBarRouter()
        let presenter = TabBarPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
