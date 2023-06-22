//
//  SignInViewController.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 22/06/23.
//

import UIKit

final class SignInViewController: UIViewController {
    
    private var viewModel = SignInViewModel()
    
    init() {
        super.init(nibName: nil, bundle: nil)

        self.viewModel.delegate = self
        self.title = "Entrar"
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let customView = SignInView()
        customView.delegate = self
        view = customView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
    }
}

// MARK: - SignInViewDelegate
extension SignInViewController: SignInViewDelegate {
    
    func didSignInButton(email: String?, password: String?) {
        viewModel.signIn(email: email, password: password)
    }
    
    func didSignUpButton() {
    }
    
}

// MARK: - SignInViewModelDelegate
extension SignInViewController: SignInViewModelDelegate {
    
    func showError(_ message: String) {
        let alertController = UIAlertController(title: "Erro ao logar", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(okAction)
        navigationController?.present(alertController, animated: true)
    }
    
    func signInSuccess() {
        let alertController = UIAlertController(title: "Sucesso ao logar", message: "logado!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(okAction)
        navigationController?.present(alertController, animated: true)
    }
}
