//
//  PinCodeRouter.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 06.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PinCodeRouter: PinCodeRouterProtocol {
    weak var view: UIViewController!
    
    func goToTabBar() {
        try? UIViewController.router.navigate(to: Screens.tabBarScreen(), animated: true, completion: nil)
    }
    
    func dismissWithResult(_ result: String) {
        print("dismissed pin code")
    }
}
