//
//  LoginViewController.swift
//  LoginAndRegisterDemo
//
//  Created by theonetech on 09/10/23.
//

import UIKit
import RealmSwift

open class LoginViewController: UIViewController, ViewFromNib {

    @IBOutlet weak var txtPassword: UITextField!{
        didSet {
            let colorPlaceholder = NSAttributedString(string: "Password",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "GrayColor") ?? .gray])
            
            txtPassword.attributedPlaceholder = colorPlaceholder
        }
    }
    
    @IBOutlet weak var txtEmail: UITextField!{
        didSet {
            let colorPlaceholder = NSAttributedString(string: "Email",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "GrayColor") ?? .gray])
            
            txtEmail.attributedPlaceholder = colorPlaceholder
        }
    }
    
    @IBOutlet weak var btnEye: UIButton!
    
    @IBOutlet weak var btnRegisterNow: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    public var buttonTitle : String = "Login"
    
   
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        // Configure UI elements based on properties
        
    }
   







    
}
