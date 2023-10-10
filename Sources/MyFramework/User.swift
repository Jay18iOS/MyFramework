//
//  User.swift
//  LoginAndRegisterDemo
//
//  Created by theonetech on 09/10/23.
//

import Foundation
import RealmSwift

public class User : Object{
    
    @objc dynamic var id        : String?
    @objc dynamic var name      : String = ""
    @objc dynamic var email     : String = ""
    @objc dynamic var mobile    : String = ""
    @objc dynamic var password  : String = ""
    
    
    
    static func createAutoUniqueID() -> String {
        return UUID().uuidString
    }
    
//    override class func primaryKey() -> String? {
//        return "id"
//    }
}
