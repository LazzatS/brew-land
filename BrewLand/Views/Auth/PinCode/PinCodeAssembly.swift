//
//  PinCodeAssembly.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 06.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RouteComposer

struct PinCodeContext {}

struct PinCodeScreenFactory: Factory {
    typealias ViewController = PinCodeViewController
    typealias Context = PinCodeContext
    
    func build(with context: PinCodeContext) throws -> PinCodeViewController {
        let view = PinCodeViewController()
        let interactor = PinCodeInteractor()
        let router = PinCodeRouter()
        let presenter = PinCodePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
