//
//  FirebaseAuthProtocol.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 20/08/23.
//

import FirebaseAuth

protocol FirebaseAuthProtocol {
    func signIn(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void)
    func signUp(email: String, password: String, completion: @escaping(Result<AuthDataResult, Error>) -> Void)
}
