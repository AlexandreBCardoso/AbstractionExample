//
//  LoginGoogleService.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 20/08/23.
//

import Foundation

final class LoginGoogleService: LoginAuthProtocol {

    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        // Instancia o Login do Facebook.
        completion(.success(.init(uid: UUID().uuidString, displayName: "any name", email: "any@gmail.com")))
    }
    
    func signUp(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void) {
        // Instancia o Login do Facebook.
        completion(.success(.init(uid: UUID().uuidString, displayName: "any name", email: "any@gmail.com")))
    }
    
}
