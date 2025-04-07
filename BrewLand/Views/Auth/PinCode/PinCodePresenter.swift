//
//  PinCodePresenter.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 06.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PinCodePresenter: PinCodePresenterProtocol {
    var view: PinCodeViewProtocol?
    var interactor: PinCodeInteractorProtocol?
    var router: PinCodeRouterProtocol?
    
    var curPinCode = String()
    
    init(view: PinCodeViewProtocol, interactor: PinCodeInteractorProtocol, router: PinCodeRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setupViews(showForgotPinButton: true, mode: .verify)
        view?.addTargets()
    }
    
    func addPinDigit(number: Int) {
        curPinCode.append("\(number)")
        if curPinCode.count < PinCodeConstants.maxCount {
            view?.updateDotsView(enteredDigits: curPinCode.count)
        } else if curPinCode.count == PinCodeConstants.maxCount {
            interactor?.verifyPinCode(curPinCode)
        } else {
            // TODO: pin code success of failure
            curPinCode = ""
        }
    }
    
}

extension PinCodePresenter: PinCodeInteractorOutputProtocol {
    func pinVerified() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            self?.router?.goToTabBar()
        }
    }
    
    func pinVerificationFailed(message: String) {
        view?.showError(message: message)
    }
}
