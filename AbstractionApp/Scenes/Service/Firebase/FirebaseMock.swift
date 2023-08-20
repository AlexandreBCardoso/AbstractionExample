//
//  FirebaseMock.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 04/07/23.
//

import FirebaseAuth

struct FirebaseMock: FirebaseAuthProtocol {
    
    func signIn(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        print("FirebaseMock - signIn")
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        print("FirebaseMock - signUp")
    }
    
}
