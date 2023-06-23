//
//  SignUpView.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 22/06/23.
//

import UIKit

protocol SignUpViewDelegate: AnyObject {
    func didSignUpButton(email: String?, password: String?, confirmPassword: String?)
    func didSignInButton()
}

final class SignUpView: UIView {

    internal weak var delegate: SignUpViewDelegate?
    
    private let emailTextField: UITextField
    private let passwordTextField: UITextField
    private let confirmPasswordTextField: UITextField
    private let signUpButton: UIButton
    private let signInButton: UIButton
    
    init() {
        emailTextField = UITextField()
        passwordTextField = UITextField()
        confirmPasswordTextField = UITextField()
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
        delegate?.didSignInButton()
    }
    
    @objc
    private func didSignUpButton() {
        delegate?.didSignUpButton(
            email: emailTextField.text,
            password: passwordTextField.text,
            confirmPassword: confirmPasswordTextField.text
        )
    }
}

// MARK: - ViewCoding
extension SignUpView: ViewCoding {

    func configure() {
        signUpButton.addTarget(self, action: #selector(didSignUpButton), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didSignInButton), for: .touchUpInside)
    }
    
    func buildHierarchy() {
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(signUpButton)
        addSubview(signInButton)
    }
    
    func buildConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
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
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 48),

            signInButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signInButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            signInButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            signInButton.heightAnchor.constraint(equalToConstant: 48),
            
            signUpButton.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -20),
            signUpButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            signUpButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            signUpButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func render() {
        backgroundColor = .white
        
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
        
        confirmPasswordTextField.placeholder = "Confirme sua senha"
        confirmPasswordTextField.textColor = .black
        confirmPasswordTextField.layer.borderWidth = 1
        confirmPasswordTextField.layer.borderColor = UIColor.gray.cgColor
        confirmPasswordTextField.layer.cornerRadius = 10
        confirmPasswordTextField.backgroundColor = .systemGray5
        confirmPasswordTextField.keyboardType = .default
        confirmPasswordTextField.leftView = UIView(frame: .init(x: 0, y: 0, width: 15, height: 0))
        confirmPasswordTextField.leftViewMode = .always

        signUpButton.setTitle("Registrar", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .systemGreen
        signUpButton.layer.cornerRadius = 10

        signInButton.setTitle("Logar", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.backgroundColor = .systemGreen
        signInButton.layer.cornerRadius = 10
    }
    
}
