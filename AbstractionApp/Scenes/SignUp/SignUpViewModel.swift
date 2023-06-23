//
//  SignUpViewModel.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 22/06/23.
//

import FirebaseAuth
import UIKit

protocol SignUpViewModelDelegate: AnyObject {
    func showError(_ message: String)
    func signUpSuccess()
}

struct SignUpViewModel {
    
    internal weak var delegate: SignUpViewModelDelegate?
    
    func signUp(email: String?, password: String?, confirmPassword: String?) {
        guard let email,
              let password,
              let confirmPassword,
              password == confirmPassword
        else {
            delegate?.showError("Preenchimento incorreto")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error {
                delegate?.showError(error.localizedDescription)
                return
            }
            
            if let _ = authDataResult {
                delegate?.signUpSuccess()
            }
        }
    }
}

