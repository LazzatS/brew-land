//
//  TabBarPresenter.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 05.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class TabBarPresenter: TabBarPresenterProtocol {
    private var interactor: TabBarInteractorProtocol
    private var router: TabBarRouterProtocol
    weak var view: TabBarViewProtocol!
    
    init(view: TabBarViewProtocol, interactor: TabBarInteractorProtocol, router: TabBarRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
}
