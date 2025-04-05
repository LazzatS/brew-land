//
//  ProfileAssembly.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 05.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RouteComposer

class ProfileAssembly: Factory {
    
    typealias ViewController = ProfileViewController
    typealias Context = Any?
    
    func build(with context: Any?) throws -> ProfileViewController {
        let view = ProfileViewController()
        let interactor = ProfileInteractor()
        let router = ProfileRouter()
        let presenter = ProfilePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
