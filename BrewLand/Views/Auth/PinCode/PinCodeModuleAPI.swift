//
//  PinCodeModuleAPI.swift
//  BrewLand
//
//  Created Lazzat Seiilova on 06.04.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: - View
protocol PinCodeViewProtocol: AnyObject {
    var presenter: PinCodePresenterProtocol? { get set }
    
    func setupViews(showForgotPinButton: Bool, mode: PinCodeMode)
    func addTargets()
    func updateDotsView(enteredDigits: Int)
//    func clearPin()
    func showError(message: String)
}

//MARK: - Presenter
protocol PinCodePresenterProtocol: AnyObject {
    var view: PinCodeViewProtocol? { get set }
    var interactor: PinCodeInteractorProtocol? { get set }
    var router: PinCodeRouterProtocol? { get set }
    
    func viewDidLoad()
    func addPinDigit(number: Int)
//    func deleteTapped()
//    func cancelTapped()
//    func validatePin(_ pin: String)
//    func showError(message: String)
}

//MARK: - Interactor
protocol PinCodeInteractorProtocol: AnyObject {
    var presenter: PinCodeInteractorOutputProtocol? { get set }
    
    func verifyPinCode(_ pin: String)
}

protocol PinCodeInteractorOutputProtocol: AnyObject {
    func pinVerified()
    func pinVerificationFailed(message: String)
}

//MARK: - Router
protocol PinCodeRouterProtocol: AnyObject {
    func goToTabBar()
    func dismissWithResult(_ result: String)
}
