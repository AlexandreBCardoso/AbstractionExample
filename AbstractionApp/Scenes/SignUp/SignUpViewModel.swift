//
//  SignUpViewModel.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 22/06/23.
//

import UIKit

protocol SignUpViewModelDelegate: AnyObject {
    func showError(_ message: String)
    func signUpSuccess()
}

struct SignUpViewModel {
    
    internal weak var delegate: SignUpViewModelDelegate?
    
    private let firebaseService = FirebaseAuthService()
    
    func signUp(email: String?, password: String?, confirmPassword: String?) {
        guard let email,
              let password,
              let confirmPassword,
              password == confirmPassword
        else {
            delegate?.showError("Preenchimento incorreto")
            return
        }
        
        firebaseService.signUp(email: email, password: password) { result in
            switch result {
                case let .success(response):
                    print("User UID: \(response.user.uid)")
                    delegate?.signUpSuccess()
                case let .failure(response):
                    delegate?.showError(response.localizedDescription)
            }
        }
    }
}

