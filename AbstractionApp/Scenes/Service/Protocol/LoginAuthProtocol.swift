//
//  LoginAuthProtocol.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 20/08/23.
//

protocol LoginAuthProtocol {
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func signUp(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void)
}
