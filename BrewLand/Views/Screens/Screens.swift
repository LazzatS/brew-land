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
