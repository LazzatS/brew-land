//
//  ProfilePresenter.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 05.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ProfilePresenter: ProfilePresenterProtocol {
    private var interactor: ProfileInteractorProtocol
    private var router: ProfileRouterProtocol
    weak var view: ProfileViewProtocol!
    
    init(view: ProfileViewProtocol, interactor: ProfileInteractorProtocol, router: ProfileRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
}
