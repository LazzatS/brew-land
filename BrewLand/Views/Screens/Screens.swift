//
//  Screens.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 03.04.2025.
//

import UIKit
import RouteComposer

enum Screens {
    
    static func loginScreen() -> DestinationStep<UINavigationController, Any?> {
        StepAssembly(
            finder: ClassFinder<UINavigationController, Any?>(),
            factory: LoginScreenFactory()
        )
        .using(GeneralAction.replaceRoot())
        .from(GeneralStep.current())
        .assemble()
    }
    
    static func pinCodeScreen() -> DestinationStep<PinCodeViewController, PinCodeContext> {
        StepAssembly(
            finder: ClassFinder<PinCodeViewController, PinCodeContext>(),
            factory: PinCodeScreenFactory()
        )
        .using(GeneralAction.presentModally(presentationStyle: .fullScreen))
        .from(GeneralStep.current())
        .assemble()
    }
    
    static func tabBarScreen(searchOptions: SearchOptions = .current) -> DestinationStep<TabBarViewController, Any?> {
        StepAssembly(
            finder: ClassFinder<TabBarViewController, Any?>(
                options: searchOptions,
                startingPoint: .root
            ),
            factory: CompleteFactoryAssembly(factory: TabBarFactory())
            // MARK: Home
                .with(
                    CompleteFactoryAssembly(
                        factory: NavigationControllerFactory<UINavigationController, Any?>(
                            configuration: { navVC in
                                navVC.tabBarItem = TabBarItem.home.tabItem
                            }
                        )
                    )
                    .with(HomeAssembly()).assemble(), using: TabBarViewController.add()
                )
            // MARK: Favourites
                .with(
                    CompleteFactoryAssembly(
                        factory: NavigationControllerFactory<UINavigationController, Any?>(
                            configuration: { navVC in
                                navVC.tabBarItem = TabBarItem.favourites.tabItem
                            }
                        )
                    )
                    .with(FavouritesAssembly()).assemble(), using: TabBarViewController.add()
                )
            // MARK: Cart
                .with(
                    CompleteFactoryAssembly(
                        factory: NavigationControllerFactory<UINavigationController, Any?>(
                            configuration: { navVC in
                                navVC.tabBarItem = TabBarItem.cart.tabItem
                            }
                        )
                    )
                    .with(CartAssembly()).assemble(), using: TabBarViewController.add()
                )
            // MARK: Location
                .with(
                    CompleteFactoryAssembly(
                        factory: NavigationControllerFactory<UINavigationController, Any?>(
                            configuration: { navVC in
                                navVC.tabBarItem = TabBarItem.location.tabItem
                            }
                        )
                    )
                    .with(LocationAssembly()).assemble(), using: TabBarViewController.add()
                )
            // MARK: Profile
                .with(
                    CompleteFactoryAssembly(
                        factory: NavigationControllerFactory<UINavigationController, Any?>(
                            configuration: { navVC in
                                navVC.tabBarItem = TabBarItem.profile.tabItem
                            }
                        )
                    )
                    .with(ProfileAssembly()).assemble(), using: TabBarViewController.add()
                )
                .assemble()
        )
        .using(GeneralAction.replaceRoot())
        .from(GeneralStep.root())
        .assemble()
    }
    
    /*
    static func profileScreen() -> DestinationStep<ProfileViewController, Any?> {
        StepAssembly(
            finder: ClassFinder<ProfileViewController, Any?>(),
            factory: ProfileScreenFactory()
        )
        .using(GeneralAction.presentModally(presentationStyle: .fullScreen, transitionStyle: .crossDissolve))
        .from(GeneralStep.current())
        .assemble()
    }
    */
}
