//
//  SignUpViewController.swift
//  AbstractionApp
//
//  Created by Alexandre Cardoso on 22/06/23.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    private var viewModel = SignUpViewModel()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Registrar"
        self.viewModel.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let customView = SignUpView()
        customView.delegate = self
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - SignUpViewDelegate
extension SignUpViewController: SignUpViewDelegate {
    
    func didSignUpButton(email: String?, password: String?, confirmPassword: String?) {
        viewModel.signUp(email: email, password: password, confirmPassword: confirmPassword)
    }
    
    func didSignInButton() {
        let viewController = SignInViewController()
        navigationController?.setViewControllers([viewController], animated: true)
    }
        
}

// MARK: - SignUpViewModelDelegate
extension SignUpViewController: SignUpViewModelDelegate {

    func showError(_ message: String) {
        let alertController = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(okAction)
        navigationController?.present(alertController, animated: true)
    }
    
    func signUpSuccess() {
        let alertController = UIAlertController(title: "Sucesso", message: "Usuário criado!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { action in
            self.didSignInButton()
        }
        alertController.addAction(okAction)
        navigationController?.present(alertController, animated: true)
    }
    
}
