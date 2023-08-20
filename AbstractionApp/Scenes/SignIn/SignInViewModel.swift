//
//  SignInViewModel.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 22/06/23.
//

import UIKit

protocol SignInViewModelDelegate: AnyObject {
    func showError(_ message: String)
    func signInSuccess()
}

struct SignInViewModel {
    
    internal weak var delegate: SignInViewModelDelegate?
    
    private let loginAuth: LoginAuthProtocol
    
    init(loginAuth: LoginAuthProtocol) {
        self.loginAuth = loginAuth
    }
    
    func signIn(email: String?, password: String?) {
        guard let email, let password else {
            delegate?.showError("Preenchimento incorreto")
            return
        }
        
        loginAuth.signIn(email: email, password: password) { result in
            switch result {
                case let .success(response):
                    print("User UID: \(response.uid)")
                    print("User displayName: \(String(describing: response.displayName))")
                    print("User email: \(String(describing: response.email))")
                    delegate?.signInSuccess()
                case let .failure(response):
                    delegate?.showError(response.localizedDescription)
            }
        }
        
    }
    
}
