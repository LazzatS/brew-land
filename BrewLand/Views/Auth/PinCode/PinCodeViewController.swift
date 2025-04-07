//
//  PinCodeViewController.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 04.04.2025.
//

import UIKit
import SnapKit

class PinCodeViewController: UIViewController, PinCodeViewProtocol {
    
    // MARK: - Properties
    var presenter: PinCodePresenterProtocol?
    
    // MARK: - UI Elements
    private let dotsView = PinDotsView()
    
    private lazy var keypadView: PinKeypadView = {
        let keypadView = PinKeypadView()
        keypadView.delegate = self
        return keypadView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = PinCodeConstants.titleText
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        label.textColor = BrewLandColor.Label.primaryDynamic
        return label
    }()
    
    private let forgotPinButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(PinCodeConstants.forgotPinText, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.tintColor = BrewLandColor.Action.enabled
        return button
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = BrewLandColor.Label.secondaryDynamic
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BrewLandColor.Background.default
        presenter?.viewDidLoad()
    }
    
    // MARK: - UI Setup
    func setupViews(showForgotPinButton: Bool, mode: PinCodeMode) {
        
        [keypadView, dotsView, titleLabel, messageLabel].forEach {
            view.addSubview($0)
        }
        
        if showForgotPinButton && mode == .verify {
            view.addSubview(forgotPinButton)
        }
        
        setupConstraints(showForgotPinButton: showForgotPinButton)
    }
    
    func addTargets() {
        // TODO: add button targets
    }
    
    // MARK: - Update methods
    func updateDotsView(enteredDigits: Int) {
        print("number of enteredDigits \(enteredDigits)")
        dotsView.colorDots(enteredDigits: enteredDigits)
    }
    
    func showError(message: String) {
        print("error message = \(message)")
        dotsView.clearDots()
    }
    
    
}

extension PinCodeViewController: PinKeypadDelegate {
    func addDigit(number: Int) {
        presenter?.addPinDigit(number: number)
    }
    
    func removeLastDigit() {
        // TODO: remove last pin
    }
}

extension PinCodeViewController {
    private func setupConstraints(showForgotPinButton: Bool = false) {
        
        // Keypad
        keypadView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        // Pin Dots
        dotsView.snp.makeConstraints {
            $0.bottom.equalTo(keypadView.snp.top).offset(-32)
            $0.centerX.equalToSuperview()
        }
        
        // Title Label
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(dotsView.snp.top).offset(-32)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.lessThanOrEqualTo(view.safeAreaLayoutGuide).inset(16).priority(.low)
        }
        
        // Message Label
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(keypadView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        // Forgot PIN Button
        if showForgotPinButton {
            forgotPinButton.snp.makeConstraints {
                $0.top.equalTo(messageLabel.snp.bottom).offset(16)
                $0.centerX.equalToSuperview()
                $0.height.equalTo(30)
            }
        }
    }
}
