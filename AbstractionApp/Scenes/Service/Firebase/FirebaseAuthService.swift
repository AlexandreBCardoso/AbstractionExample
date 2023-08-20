//
//  FirebaseAuthService.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 28/06/23.
//

import FirebaseAuth

final class FirebaseAuthService: FirebaseAuthProtocol {
    
    func signIn(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error {
                completion(.failure(error))
            }
            
            if let data = authDataResult {
                completion(.success(data))
            } else {
                completion(.failure(NSError(domain: "Dados Vazio", code: 1)))
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping(Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error {
                completion(.failure(error))
            }
            
            if let authDataResult = authDataResult {
                completion(.success(authDataResult))
            } else {
                completion(.failure(NSError(domain: "Dados Vazio", code: 1)))
            }
        }
    }
}
