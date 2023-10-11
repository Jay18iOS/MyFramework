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
        button.frame.size.height = 50
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        // Add subviews to the view
//        view.addSubview(nameTextField)
//        view.addSubview(emailTextField)
//        view.addSubview(mobileTextField)
//        view.addSubview(passwordTextField)
//        view.addSubview(confirmPasswordTextField)
//        view.addSubview(registerButton)
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
        
        // Add the components to the view
        let stackView = UIStackView(arrangedSubviews: [nameTextField, emailTextField, mobileTextField, passwordTextField, confirmPasswordTextField, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        // Set constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])

    }
    
    @objc func registerButtonTapped() {
            // Handle registration logic here
        }

        @objc func backButtonTapped() {
            // Handle navigation back action here
            //navigationController?.popViewController(animated: true)
            self.dismiss(animated: true)
        }
    }

    

