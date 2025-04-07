//
//  PinCodeInteractor.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 06.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class PinCodeInteractor: PinCodeInteractorProtocol {
    var presenter: PinCodeInteractorOutputProtocol?
    
    private var chances: Int = 3
    
    func verifyPinCode(_ pin: String) {
        chances -= 1
        
        if pin == "1111" && chances > 0 {
            presenter?.pinVerified()
        } else if chances == 0 {
            // TODO: chances = 3 and go to login?
        } else {
            presenter?.pinVerificationFailed(message: "Wrong pin")
        }
    }
}
