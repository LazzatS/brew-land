//
//  LocationAssembly.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 05.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RouteComposer

class LocationAssembly: Factory {
    
    typealias ViewController = LocationViewController
    typealias Context = Any?
    
    func build(with context: Any?) throws -> LocationViewController {
        let view = LocationViewController()
        let interactor = LocationInteractor()
        let router = LocationRouter()
        let presenter = LocationPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
