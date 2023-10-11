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
           button.backgroundColor = .blue
           button.frame.size.height = 50
           button.frame.size.width = 200
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
           //button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
       
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print(validate(name: "Pooja", email: "pooja@gmail.com", phoneNumber: "9876543210", password: "123456", confirmPw: "123456"))
        
        view.backgroundColor = .white
        
        // Add subviews to the view
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(showHidePasswordButton)
        view.addSubview(loginButton)
        view.addSubview(newUserLabel)
        view.addSubview(registerButton)
        
        // Layout constraints
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            showHidePasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            showHidePasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: showHidePasswordButton.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            newUserLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            newUserLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            registerButton.topAnchor.constraint(equalTo: newUserLabel.bottomAnchor, constant: 8),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
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
            let vc = SignupViewController()
            let navigationController = UINavigationController()
            navigationController.pushViewController(vc, animated: true)


        }
    
    /*func validate(name: String, email: String, phoneNumber: String, password: String, confirmPw: String) -> String? {
        if name.trimmingCharacters(in: .whitespaces).count == 0{
            return "Please enter name"
        }
        else if email.trimmingCharacters(in: .whitespaces).count == 0{
            return "Please enter email"
        }
        else if !Helper.isValidEmail(testStr: email){
            return "Please enter valid email"
        }
        else if (phoneNumber.trimmingCharacters(in: .whitespaces).count) < 10{
            return "Please enter valid mobile number"
        }
        else if password.trimmingCharacters(in: .whitespaces).count < 6{
            return "Password should be minimum six characters long"
        }
        else if password != confirmPw{
            return "Password and Confirm password should match"
        }
        return nil
    }*/
    
    /*func validateLoginData(email: String, pw: String) -> String?{
        if email.trimmingCharacters(in: .whitespaces).count == 0{
            return "Please enter email"
        }
        else if !Helper.isValidEmail(testStr: email){
            return "Please enter valid email"
        }
        else if pw.trimmingCharacters(in: .whitespaces).count == 0{
            return "Please enter password"
        }
        return nil
    }*/
    
      
   /* func registerUser(name: String, email: String, mobile: String, password: String, confirmPw: String) -> Result<User, UserRegistrationError> {
        let errorStr = validate(name: name, email: email, phoneNumber: mobile, password: password, confirmPw: confirmPw)
        if errorStr == nil{
            //registre user
            do {
                // Check if a user with the provided email already exists
                if let existingUser = realm.objects(User.self).filter("email == %@", email).first {
                    return .failure(UserRegistrationError("A user with this email already exists."))
                }
                
                // Check if a user with the provided mobile already exists
                if let existingUser = realm.objects(User.self).filter("mobile == %@", mobile).first {
                    return .failure(UserRegistrationError("A user with this mobile number already exists."))
                }
                let user = User()
                user.id  = User.createAutoUniqueID()
                return .success(user)
            }catch{
                return .failure(UserRegistrationError("Failed to register user"))
            }
        }else{
            //validation fail throw error
            return .failure(UserRegistrationError(errorStr!))
        }
        
        
    }*/
    
   /*public func loginUser(email: String, password: String) -> Result<User, UserRegistrationError> {
        // Validate input (e.g., check for empty fields)
        let errorStr = validateLoginData(email: email, pw: password)
        if errorStr == nil{
            //login user
            
            do {
                let realm = try Realm()
                // Try to find a user with the provided email
                if let user = realm.objects(User.self).filter("email == %@", email).first {
                    // Check if the password matches
                    if user.password == password {
                        // Successful login
                        return .success(user)
                    } else {
                        return .failure(UserRegistrationError("Incorrect password."))
                    }
                } else {
                    return .failure(UserRegistrationError("User not found with this email."))
                }
            } catch {
                return .failure(UserRegistrationError("An error occurred during login."))
            }
            
        }else{
            //validation fail throw error
            return .failure(UserRegistrationError(errorStr!))
        }
    }*/
   
}

