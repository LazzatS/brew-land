//
//  PinCodeScreenFactory.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 04.04.2025.
//

import UIKit
import RouteComposer

struct PinCodeContext {}

struct PinCodeScreenFactory: Factory {
    typealias ViewController = PinCodeViewController
    typealias Context = PinCodeContext
    
    func build(with context: PinCodeContext) throws -> PinCodeViewController {
        let view = PinCodeViewController()
        return view
    }
}
