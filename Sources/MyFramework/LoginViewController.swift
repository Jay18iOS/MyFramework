//
//  ViewController.swift
//  LoginAndRegisterDemo
//
//  Created by theonetech on 09/10/23.
//

import UIKit

public class LoginViewController: UIViewController {

    public let emailTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Email"
            textField.keyboardType = .emailAddress
            textField.borderStyle = .roundedRect
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
    
    public let passwordTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Password"
           textField.isSecureTextEntry = true
           textField.borderStyle = .roundedRect
           textField.translatesAutoresizingMaskIntoConstraints = false
           return textField
       }()
       
    public let showHidePasswordButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Show", for: .normal)
           button.addTarget(self, action: #selector(showHidePasswordButtonTapped), for: .touchUpInside)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
       
    public let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
       
    public let newUserLabel: UILabel = {
           let label = UILabel()
           label.text = "New User?"
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
    public let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
       
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Add subviews to the view
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(showHidePasswordButton)
        view.addSubview(loginButton)
        view.addSubview(newUserLabel)
        view.addSubview(registerButton)
        
        loginButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        // Layout constraints
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            showHidePasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            showHidePasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.topAnchor.constraint(equalTo: showHidePasswordButton.bottomAnchor, constant: 20),
            
            newUserLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 40),
            newUserLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            
            registerButton.topAnchor.constraint(equalTo: newUserLabel.topAnchor, constant: -6), // Align with newUserLabel's top
            registerButton.leadingAnchor.constraint(equalTo: newUserLabel.trailingAnchor, constant: 8),
            
        ])
    }

    @objc func showHidePasswordButtonTapped() {
        // Toggle the password visibility
        passwordTextField.isSecureTextEntry.toggle()
        showHidePasswordButton.setTitle(passwordTextField.isSecureTextEntry ? "Show" : "Hide", for: .normal)
    }
        
    @objc func loginButtonTapped() {
        // Implement your login logic here
        
    }
        
    @objc func registerButtonTapped() {
        // Implement your registration logic here
        let navigationController = UINavigationController()
        
        let vc = SignupViewController()
        navigationController.pushViewController(vc, animated: true)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
   
}

