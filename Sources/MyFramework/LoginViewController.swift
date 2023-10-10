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
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print(validate(name: "Pooja", email: "pooja@gmail.com", phoneNumber: "9876543210", password: "123456", confirmPw: "123456"))
        
        view.backgroundColor = .white
        
        // Add subviews to the view
        view.addSubview(emailTextField)
        
        // Layout constraints
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
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

