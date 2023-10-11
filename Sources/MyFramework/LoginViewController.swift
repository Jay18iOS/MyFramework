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
        let heightConstraint = textField.heightAnchor.constraint(equalToConstant: 40) // Adjust the height as needed
        heightConstraint.isActive = true
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    public let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        let heightConstraint = textField.heightAnchor.constraint(equalToConstant: 40) // Adjust the height as needed
        heightConstraint.isActive = true
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    public let showHidePasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show", for: .normal)
        button.setTitleColor(UIColor(red: 0.0, green: 151.0/255.0, blue: 178.0/255.0, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(showHidePasswordButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.0, green: 151.0/255.0, blue: 178.0/255.0, alpha: 1.0) //UIColor(named: "GreenColor")
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let newUserLabel: UILabel = {
        let label = UILabel()
        label.text = "New User?"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor(red: 0.0, green: 151.0/255.0, blue: 178.0/255.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public var user : User?
    public var loginCompletion: ((User) -> Void)?
    
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
        
        // Create a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func showHidePasswordButtonTapped() {
        // Toggle the password visibility
        passwordTextField.isSecureTextEntry.toggle()
        showHidePasswordButton.setTitle(passwordTextField.isSecureTextEntry ? "Show" : "Hide", for: .normal)
    }
    
    @objc func loginButtonTapped() {
        // Implement your login logic here
        let loginResult = LoginSDK.loginUser(email: self.emailTextField.text!, password: self.passwordTextField.text!)
        switch loginResult {
        case .success(let user):
            print("User login successfully: \(user)")
            self.user = user
            
            self.emailTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
            
            // Call the completion handler with the user object
            loginCompletion?(user)
            
        case .failure(let error):
            print("login error: \(error.errorDescription)")
            
            self.emailTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                Helper.globalToastAlert(controller: self, msg: error.errorDescription ?? "error occured", seconds: 3.0)
            }
        }
    }
    
    @objc func registerButtonTapped() {
        // Implement your registration logic here
        let navigationController = UINavigationController()
        
        let vc = SignupViewController()
        navigationController.pushViewController(vc, animated: true)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @objc func handleTap() {
        // Dismiss the keyboard
        view.endEditing(true)
    }
    
    
}

