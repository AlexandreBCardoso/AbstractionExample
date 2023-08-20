//
//  SignInFactory.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 20/08/23.
//

import UIKit

struct SignInFactory {
    
    static func make() -> UIViewController {
        let _ = SignInViewModel(loginAuth: LoginFirebaseService())
        let _ = SignInViewModel(loginAuth: LoginFacebookService())
        let viewModel = SignInViewModel(loginAuth: LoginGoogleService())
        
        let viewController = SignInViewController(viewModel: viewModel)

        return viewController
    }
}
