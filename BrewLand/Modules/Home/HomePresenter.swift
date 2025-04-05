//
//  HomePresenter.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 05.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class HomePresenter: HomePresenterProtocol {
    private var interactor: HomeInteractorProtocol
    private var router: HomeRouterProtocol
    weak var view: HomeViewProtocol!
    
    init(view: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
}
