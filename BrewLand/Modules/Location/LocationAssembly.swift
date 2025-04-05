//
//  LocationAssembly.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 05.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class LocationAssembly {
    
    func build() -> UIViewController {
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
