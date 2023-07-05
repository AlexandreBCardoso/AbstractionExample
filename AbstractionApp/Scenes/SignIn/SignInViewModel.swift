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
    
    private let firebaseService: FirebaseAuthProtocol
    
    init(firebaseService: FirebaseAuthProtocol) {
        self.firebaseService = firebaseService
    }
    
    func signIn(email: String?, password: String?) {
        guard let email, let password else {
            delegate?.showError("Preenchimento incorreto")
            return
        }
        
        firebaseService.signIn(email: email, password: password) { result in
            switch result {
                case let .success(response):
                    print("User UID: \(response.user.uid)")
                    delegate?.signInSuccess()
                case let .failure(response):
                    delegate?.showError(response.localizedDescription)
            }
        }
        
    }
    
}
