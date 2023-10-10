//
//  SingupSDK.swift
//  LoginAndRegisterDemo
//
//  Created by theonetech on 10/10/23.
//

import Foundation
import RealmSwift

public struct SignupSDK {
    
    public func validate(name: String, email: String, phoneNumber: String, password: String, confirmPw: String) -> String? {
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
    }
    
     public func registerUser(name: String, email: String, mobile: String, password: String, confirmPw: String) -> Result<User, UserRegistrationError> {
         let errorStr = validate(name: name, email: email, phoneNumber: mobile, password: password, confirmPw: confirmPw)
         if errorStr == nil{
             //registre user
             do {
                 let realm = try Realm()
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
                 user.email = email
                 user.name = name
                 user.mobile = mobile
                 user.password = password
                 
                 try realm.write {
                     realm.add(user)
                 }
                 return .success(user)
             }catch{
                 return .failure(UserRegistrationError("Failed to register user"))
             }
         }else{
             //validation fail throw error
             return .failure(UserRegistrationError(errorStr!))
         }
         
     }
    
}
