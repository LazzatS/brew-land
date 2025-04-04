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
    
    static func profileScreen() -> DestinationStep<ProfileViewController, Any?> {
        StepAssembly(
            finder: ClassFinder<ProfileViewController, Any?>(),
            factory: ProfileScreenFactory()
        )
        .using(GeneralAction.presentModally(presentationStyle: .fullScreen, transitionStyle: .crossDissolve))
        .from(GeneralStep.current())
        .assemble()
    }
}

// TODO: Temp
struct ProfileScreenFactory: Factory {
    typealias ViewController = ProfileViewController
    typealias Context = Any?
    
    func build(with context: Any?) throws -> ProfileViewController {
        let view = ProfileViewController()
        return view
    }
}

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .systemPurple
    }
}
