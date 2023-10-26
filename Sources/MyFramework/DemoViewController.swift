//
//  DemoViewController.swift
//  
//
//  Created by theonetech on 26/10/23.
//

import UIKit

public class DemoViewController: UIViewController {

    @IBOutlet weak var WelcomLbl: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.WelcomLbl.text = "Hello !! Pooja. Welcome 😀"
        // Do any additional setup after loading the view.
    }
    

    public func MyCustomFrameworkBundle() -> Bundle? {
        let frameworkBundle = Bundle(for: DemoViewController.self)
        return frameworkBundle
    }

}
