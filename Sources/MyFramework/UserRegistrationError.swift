//
//  UserRegistrationError.swift
//  LoginAndRegisterDemo
//
//  Created by theonetech on 09/10/23.
//

import Foundation

public class UserRegistrationError: Error {
    public let message: String

    public init(_ message: String) {
        self.message = message
    }
}
