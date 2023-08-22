//
//  SignUpViewModel.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 22/06/23.
//

import LoginAuth
import UIKit

protocol SignUpViewModelDelegate: AnyObject {
    func showError(_ message: String)
    func signUpSuccess()
}

struct SignUpViewModel {
    
    internal weak var delegate: SignUpViewModelDelegate?
    
    private let loginAuth: LoginAuthProtocol
    
    init(loginAuth: LoginAuthProtocol) {
        self.loginAuth = loginAuth
    }
    
    func signUp(email: String?, password: String?, confirmPassword: String?) {
        guard let email,
              let password,
              let confirmPassword,
              password == confirmPassword
        else {
            delegate?.showError("Preenchimento incorreto")
            return
        }
        
        loginAuth.signUp(email: email, password: password) { result in
            switch result {
                case let .success(response):
                    print("User UID: \(response.uid)")
                    delegate?.signUpSuccess()
                case let .failure(response):
                    delegate?.showError(response.localizedDescription)
            }
        }
    }
}

