//
//  Helper.swift
//  LoginAndRegisterDemo
//
//  Created by theonetech on 09/10/23.
//

import Foundation
import UIKit

class Helper: NSObject{
    
    
    /* ====   MARK: VALID EMAIl FUNCTION   ==== */
    class func isValidEmail(testStr:String) -> Bool {
        let REGEX: String
        REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", REGEX).evaluate(with: testStr)
    }
    
    /* ====   MARK: Global toast msg using alert   ==== */
    class func globalToastAlert(controller: UIViewController, msg: String, seconds: Double, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.white
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true) {
                completion?() // Call the completion handler when dismissing
            }
        }
    }

}
