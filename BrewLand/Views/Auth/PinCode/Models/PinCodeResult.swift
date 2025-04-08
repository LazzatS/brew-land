//
//  PinCodeResult.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 07.04.2025.
//

import Foundation

enum PinCodeResult {
    case success(pin: String, deeplink: String?)
    case pinCreated(pin: String)
    case pinChanged(oldPin: String, newPin: String)
    case cancelled
    case forgotPin
}
