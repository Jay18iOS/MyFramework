//
//  UserRegistrationError.swift
//  LoginAndRegisterDemo
//
//  Created by theonetech on 09/10/23.
//

import Foundation

public class UserRegistrationError: Error {
    let message: String

    init(_ message: String) {
        self.message = message
    }
}
