//
//  SignInFactory.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 20/08/23.
//

import LoginAuth
import UIKit

struct SignInFactory {
    
    static func make() -> UIViewController {
        let viewModel = SignInViewModel(loginAuth: LoginFirebaseService())
        let _ = SignInViewModel(loginAuth: LoginFacebookService())
        let _ = SignInViewModel(loginAuth: LoginGoogleService())
        
        let viewController = SignInViewController(viewModel: viewModel)

        return viewController
    }
}
