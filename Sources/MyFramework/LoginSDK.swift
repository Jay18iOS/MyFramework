//
//  LoginSDK.swift
//  demofr
//
//  Created by theonetech on 09/10/23.
//

import Foundation
import RealmSwift

public struct LoginSDK{
    
    static func validateLoginData(email: String, pw: String) -> String?{
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
    }

    public static func loginUser(email: String, password: String) -> Result<User, UserRegistrationError> {
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
     }
}
