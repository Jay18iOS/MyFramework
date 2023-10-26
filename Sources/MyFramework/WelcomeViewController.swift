//
//  WelcomeViewController.swift
//  MyFrameworkWithDB
//
//  Created by theonetech on 26/10/23.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcmLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcmLbl.text = "Welcome Pooja 😀"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
