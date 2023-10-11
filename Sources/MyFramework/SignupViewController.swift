//
//  SignupViewController.swift
//  LoginAndRegisterDemo
//
//  Created by theonetech on 10/10/23.
//

import UIKit

public class SignupViewController: UIViewController {
    
    public let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    public let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    public let mobileTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Mobile"
        textField.keyboardType = .phonePad
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
    
    public let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    public let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public var user : User?
    public var errorString: String = "error"
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        view.addSubview(registerButton)
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
        
        registerButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        // Add the components to the view
        let stackView = UIStackView(arrangedSubviews: [nameTextField, emailTextField, mobileTextField, passwordTextField, confirmPasswordTextField])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        // Set constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        ])
        
        NSLayoutConstraint.activate([
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    
    @objc func registerButtonTapped() {
        self.view.endEditing(true)
        
        // Handle registration logic here
        let registrationResult = SignupSDK.registerUser(name: self.nameTextField.text!, email: self.emailTextField.text!, mobile: self.mobileTextField.text!, password: self.passwordTextField.text!, confirmPw: self.confirmPasswordTextField.text!)
        
        switch registrationResult {
        case .success(let user):
            print("User registered successfully: \(user)")
            self.user = user
            
            self.nameTextField.resignFirstResponder()
            self.emailTextField.resignFirstResponder()
            self.mobileTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
            self.confirmPasswordTextField.resignFirstResponder()
            
            DispatchQueue.main.async {
                Helper.globalToastAlert(controller: self, msg: "User registered successfully", seconds: 3.0) {
                    // Handle any additional actions after the toast is shown (e.g., dismiss the view controller)
                    self.dismiss(animated: true)
                }
            }
        
        case .failure(let error):
            print("Registration error: \(error.errorDescription)")
            self.errorString = error.errorDescription ?? "error"
            self.nameTextField.resignFirstResponder()
            self.emailTextField.resignFirstResponder()
            self.mobileTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
            self.confirmPasswordTextField.resignFirstResponder()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                Helper.globalToastAlert(controller: self, msg: self.errorString, seconds: 3.0)
            }
        }
    }
    
    @objc func backButtonTapped() {
        // Handle navigation back action here
        //navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
    }
}

    

