//
//  LoginConfiguration.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 04.04.2025.
//

import UIKit
import RouteComposer

enum LoginConfiguration {
    
    static func login() -> Destination<LoginViewController, Void> {
        let loginScreen = StepAssembly(
            finder: ClassFinder<LoginViewController, Void>(),
            factory: NilFactory()
        )
            .from(SingleStep(
                finder: NilFinder(),
                factory: ClassFactory<UINavigationController, Void>()
            ))
            .using(GeneralAction.presentModally(presentationStyle: .formSheet))
            .from(GeneralStep.current())
            .assemble()
        
        return Destination(to: loginScreen)
    }
}
