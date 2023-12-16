//
//  LoginView.swift
//  LoginApp
//
//  Created by Terretino on 16/12/23.
//

import Foundation
import UIKit
import SwiftUI

class LoginView: UIViewController, LoginPresenterToView {
    var presenter: LoginViewToPresenter?

    let loginTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.text = "Login into your account"
        label.textAlignment = .center
        return label
    }()
    
    let texfieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    let usernameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 4
        return textField
    }()
    
    let passwordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let loginButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .vertical
        return stackView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        return button
    }()
    
    let indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        return view
    }()
    
    let indicatorOverlay: UIView = {
        let view = UIView()
        return view
    }()
    
    let underlyingErrorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemRed
        label.text = "error"
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    private func setupLoginView() {
        view.backgroundColor = .white
        view.addSubview(loginTitle)
        loginTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            loginTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(texfieldStackView)
        texfieldStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            texfieldStackView.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 64),
            texfieldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            texfieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        texfieldStackView.addArrangedSubview(usernameField)
        texfieldStackView.addArrangedSubview(passwordField)
        
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        usernameField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        view.addSubview(loginButtonStackView)
        loginButtonStackView.addArrangedSubview(loginButton)
        loginButtonStackView.addArrangedSubview(underlyingErrorLabel)
        
        loginButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButtonStackView.topAnchor.constraint(equalTo: texfieldStackView.bottomAnchor, constant: 32),
            loginButtonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButtonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50
                                               )
        ])
        loginButton.backgroundColor = .systemBlue
        
        loginButton.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
        
    }
    
    private func setupLoadingView() {
        view.addSubview(indicatorOverlay)
        indicatorOverlay.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicatorOverlay.topAnchor.constraint(equalTo: view.topAnchor),
            indicatorOverlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            indicatorOverlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            indicatorOverlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        indicatorOverlay.addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicatorView.topAnchor.constraint(equalTo: indicatorOverlay.topAnchor),
            indicatorView.leadingAnchor.constraint(equalTo: indicatorOverlay.leadingAnchor),
            indicatorView.trailingAnchor.constraint(equalTo: indicatorOverlay.trailingAnchor),
            indicatorView.bottomAnchor.constraint(equalTo: indicatorOverlay.bottomAnchor),
        ])
        indicatorOverlay.backgroundColor = .black
        indicatorOverlay.alpha = 0.5
        indicatorOverlay.isHidden = true
    }
    
    @objc func buttonDidTapped() {
        underlyingErrorLabel.isHidden = true
        indicatorOverlay.isHidden = false
        indicatorView.startAnimating()
        presenter?.doLogin(email: usernameField.text, password: passwordField.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginView()
        setupLoadingView()
    }
    
    func showLoginFailed(error: String) {
        if underlyingErrorLabel.isHidden {
            underlyingErrorLabel.text = error
            underlyingErrorLabel.isHidden = false
        }
    }
    
    func stopLoading() {
        indicatorOverlay.isHidden = true
        indicatorView.stopAnimating()
    }
}


struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            // Return whatever controller you want to preview
            let vc = LoginView()
            return vc
        }
    }
}

struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
    
    let viewController: ViewController

    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }
}

