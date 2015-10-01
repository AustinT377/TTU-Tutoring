//
//  LoginViewController.swift
//  TTUTutoring
//
//  Created by Dane Lowrey on 9/30/15.
//  Copyright © 2015 Turner. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var hometitle: UILabel!
    @IBOutlet weak var username_box: UITextField!
    @IBOutlet weak var password_box: UITextField!
    @IBAction func loginButton(sender: AnyObject) {
    }

    @IBOutlet weak var login_button: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //do any additional setup after loading
        
            /*Make the Login_button have rounded corners*/
        login_button.layer.cornerRadius = login_button.frame.size.width/10
        login_button.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
