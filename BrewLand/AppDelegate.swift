//
//  AppDelegate.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 28.03.2025.
//

import UIKit
import RouteComposer

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var router: MainRouter?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemCyan
        let router = MainRouter(router: DefaultRouter(), window: window)
        self.router = router
        window?.makeKeyAndVisible()
        router.showRootScreen()
        return true
    }
}
