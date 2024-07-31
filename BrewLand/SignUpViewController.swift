//
//  SignUpViewController.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 29.07.2024.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        return button
    }()
    
    private lazy var loginStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 8
        [loginLabel, loginButton].forEach {
            view.addArrangedSubview($0)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
    }
    
    private func setup() {
        view.addSubview(signUpLabel)
        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(loginStackView)
        NSLayoutConstraint.activate([
            loginStackView.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 32),
            loginStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
