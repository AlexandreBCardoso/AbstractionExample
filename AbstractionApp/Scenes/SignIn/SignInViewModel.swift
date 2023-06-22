//
//  SignInViewModel.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 22/06/23.
//

import FirebaseAuth
import UIKit

protocol SignInViewModelDelegate: AnyObject {
    func showError(_ message: String)
    func signInSuccess()
}

struct SignInViewModel {
    
    internal weak var delegate: SignInViewModelDelegate?
    
    func signIn(email: String?, password: String?) {
        guard let email, let password else {
            delegate?.showError("Preenchimento incorreto")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error {
                delegate?.showError(error.localizedDescription)
                return
            }
            
            if let _ = authDataResult {
                delegate?.signInSuccess()
            }
        }
    }
}
