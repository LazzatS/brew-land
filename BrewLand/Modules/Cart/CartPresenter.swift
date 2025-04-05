//
//  CartPresenter.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 05.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class CartPresenter: CartPresenterProtocol {
    private var interactor: CartInteractorProtocol
    private var router: CartRouterProtocol
    weak var view: CartViewProtocol!
    
    init(view: CartViewProtocol, interactor: CartInteractorProtocol, router: CartRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
}
