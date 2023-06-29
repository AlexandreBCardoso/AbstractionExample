//
//  SignInView.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 22/06/23.
//

import UIKit

protocol SignInViewDelegate: AnyObject {
    func didSignInButton(email: String?, password: String?)
    func didSignUpButton()
}

final class SignInView: UIView {

    internal weak var delegate: SignInViewDelegate?
    
    private let emailTextField: UITextField
    private let passwordTextField: UITextField
    private let signInButton: UIButton
    private let signUpButton: UIButton
    
    init() {
        emailTextField = UITextField()
        passwordTextField = UITextField()
        signInButton = UIButton()
        signUpButton = UIButton()
        
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didSignInButton() {
        delegate?.didSignInButton(
            email: emailTextField.text,
            password: passwordTextField.text
        )
    }
    
    @objc
    private func didSignUpButton() {
        delegate?.didSignUpButton()
    }
}

// MARK: - ViewCoding
extension SignInView: ViewCoding {

    func configure() {
        signInButton.addTarget(self, action: #selector(didSignInButton), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(didSignUpButton), for: .touchUpInside)
    }
    
    func buildHierarchy() {
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(signInButton)
        addSubview(signUpButton)
    }
    
    func buildConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25),
            passwordTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            signUpButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signUpButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            signUpButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            signUpButton.heightAnchor.constraint(equalToConstant: 48),
            
            signInButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -20),
            signInButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            signInButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            signInButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func render() {
        backgroundColor = .white
        
        emailTextField.text = "teste@teste.com"
        passwordTextField.text = "123456"
        
        emailTextField.placeholder = "Endereço de email para logar"
        emailTextField.textColor = .black
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.gray.cgColor
        emailTextField.layer.cornerRadius = 10
        emailTextField.backgroundColor = .systemGray5
        emailTextField.keyboardType = .emailAddress
        emailTextField.leftView = UIView(frame: .init(x: 0, y: 0, width: 15, height: 0))
        emailTextField.leftViewMode = .always
        emailTextField.autocapitalizationType = .none
        
        passwordTextField.placeholder = "Digite sua senha"
        passwordTextField.textColor = .black
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.backgroundColor = .systemGray5
        passwordTextField.keyboardType = .default
        passwordTextField.leftView = UIView(frame: .init(x: 0, y: 0, width: 15, height: 0))
        passwordTextField.leftViewMode = .always
        
        signInButton.setTitle("Entrar", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.backgroundColor = .systemGreen
        signInButton.layer.cornerRadius = 10
        
        signUpButton.setTitle("Registrar", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .systemGreen
        signUpButton.layer.cornerRadius = 10
    }
    
}
