//
//  CartAssembly.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 05.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class CartAssembly {
    
    func build() -> UIViewController {
        let view = CartViewController()
        let interactor = CartInteractor()
        let router = CartRouter()
        let presenter = CartPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
}
