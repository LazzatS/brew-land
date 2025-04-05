//
//  FavouritesAssembly.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 05.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RouteComposer

class FavouritesAssembly: Factory {
    
    typealias ViewController = FavouritesViewController
    typealias Context = Any?
    
    func build(with context: Any?) throws -> FavouritesViewController {
        let view = FavouritesViewController()
        let interactor = FavouritesInteractor()
        let router = FavouritesRouter()
        let presenter = FavouritesPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
