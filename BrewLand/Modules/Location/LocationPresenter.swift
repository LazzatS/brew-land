//
//  LocationPresenter.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 05.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class LocationPresenter: LocationPresenterProtocol {
    private var interactor: LocationInteractorProtocol
    private var router: LocationRouterProtocol
    weak var view: LocationViewProtocol!
    
    init(view: LocationViewProtocol, interactor: LocationInteractorProtocol, router: LocationRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
}
