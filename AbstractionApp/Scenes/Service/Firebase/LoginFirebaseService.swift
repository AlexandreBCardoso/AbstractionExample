//
//  LoginFirebaseService.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 20/08/23.
//

import FirebaseAuth

struct LoginFirebaseService: LoginAuthProtocol {

    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error {
                completion(.failure(error))
            }
            
            if let userFirebase = authDataResult?.user {
                let user = User(
                    uid: userFirebase.uid,
                    displayName: userFirebase.displayName ?? String(),
                    email: userFirebase.email ?? String()
                )
                completion(.success(user))
            } else {
                completion(.failure(NSError(domain: "Dados Vazio", code: 1)))
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error {
                completion(.failure(error))
            }
            
            if let userFirebase = authDataResult?.user {
                let user = User(
                    uid: userFirebase.uid,
                    displayName: userFirebase.displayName ?? String(),
                    email: userFirebase.email ?? String()
                )
                completion(.success(user))
            } else {
                completion(.failure(NSError(domain: "Dados Vazio", code: 1)))
            }
        }
    }
    
}
