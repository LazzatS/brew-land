//
//  FavouritesPresenter.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 05.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class FavouritesPresenter: FavouritesPresenterProtocol {
    private var interactor: FavouritesInteractorProtocol
    private var router: FavouritesRouterProtocol
    weak var view: FavouritesViewProtocol!
    
    init(view: FavouritesViewProtocol, interactor: FavouritesInteractorProtocol, router: FavouritesRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
}
