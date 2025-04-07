//
//  LoginViewController.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 28.03.2025.
//

import UIKit
import RouteComposer

class LoginViewController: UIViewController {
    
    var interceptorCompletionBlock: ((_: RoutingResult) -> Void)? {
        willSet {
            guard let completion = interceptorCompletionBlock else {
                return
            }
            
            completion(.failure(RoutingError.generic(
                .init("New completion block was set. " +
                      "Previous navigation process should be halted."))))
            
        }
    }
    
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isLoggedIn {
            view.backgroundColor = .systemRed
            loginButton.backgroundColor = .systemYellow
            view.addSubview(loginButton)
            loginButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                loginButton.widthAnchor.constraint(equalToConstant: 150),
                loginButton.heightAnchor.constraint(equalToConstant: 50),
                loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
            loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        } else {
            DispatchQueue.main.async {
                let context = PinCodeContext()
                try? UIViewController.router.navigate(to: Screens.pinCodeScreen(), with: context, animated: true, completion: nil)
            }
        }
        
        
    }
    
    @objc func didTapLogin() {
        let mainQueue = DispatchQueue.main
        let deadline = DispatchTime.now() + .seconds(2)
        
        mainQueue.asyncAfter(deadline: deadline) {
            
            isLoggedIn = true
            self.dismiss(animated: true) {
                self.interceptorCompletionBlock?(.success)
            }
        }
    }
}
