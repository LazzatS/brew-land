//
//  PinCodeInterceptor.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 04.04.2025.
//

import UIKit
import RouteComposer

var isLoggedIn: Bool = false

struct PinCodeInterceptor<C>: RoutingInterceptor {
    typealias Context = C
    
    func perform(with context: C, completion: @escaping (RoutingResult) -> Void) {
        guard !isLoggedIn else {
            completion(.success)
            return
        }
        
        let destination = LoginConfiguration.login()
        do {
            try UIViewController.router.navigate(to: destination) { routingResult in
                guard routingResult.isSuccessful,
                      let viewController = ClassFinder<LoginViewController, Any?>().getViewController()
                else {
                    completion(.failure(RoutingError.compositionFailed(
                        .init("LoginViewController was not found.")))
                    )
                    return
                }
                
                viewController.interceptorCompletionBlock = completion
            }
        } catch {
            completion(.failure(RoutingError.compositionFailed(
                .init("Could not present login view controller", underlyingError: error)))
            )
        }
    }
}
