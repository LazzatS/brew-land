//
//  TabBarViewController.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 05.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, TabBarViewProtocol {
    var presenter: TabBarPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        UITabBar.appearance().barTintColor = .purple
        UITabBar.appearance().unselectedItemTintColor = .carrot
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("ok")
    }
}
