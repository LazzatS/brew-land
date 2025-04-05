//
//  PinCodeViewController.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 04.04.2025.
//

import UIKit

class PinCodeViewController: UIViewController {
    
    // MARK: - UI Elements
    private let titleLabel = UILabel()
    private let pinCodeButton = UIButton()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .white
        
        // Title Label
        titleLabel.text = "No PIN, just"
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // TODO: temp Button
        pinCodeButton.setTitle("click to enter", for: .normal)
        pinCodeButton.backgroundColor = .systemGreen
        pinCodeButton.translatesAutoresizingMaskIntoConstraints = false
        pinCodeButton.addTarget(self, action: #selector(validatePin), for: .touchUpInside)
        view.addSubview(pinCodeButton)
        NSLayoutConstraint.activate([
            pinCodeButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            pinCodeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pinCodeButton.widthAnchor.constraint(equalToConstant: 150),
            pinCodeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func validatePin() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.goToProfile()
        }
    }
    
    private func goToProfile() {
//        try? router.navigate(to: Screens.profileScreen(), animated: true, completion: nil)
    }
}
