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
        
        PFUser.logInWithUsernameInBackground(username_box.text!, password: password_box.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            } else {
                let alert = UIAlertController(title: "Error", message: "User does not exist", preferredStyle: UIAlertControllerStyle.Alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(action)
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
        }
        
        
        
    }

    @IBOutlet weak var login_button: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("check if user logged in before")
        let currentUser = PFUser.currentUser()
        if currentUser != nil {
            print("user is logged in")
            print(PFUser.currentUser())
            self.performSegueWithIdentifier("loginSegue", sender: nil)
            
        }
        else {
            print("user not logged in ")
            // Show the signup or login screen
        }

        
            /*Make the Login_button have rounded corners*/
        login_button.layer.cornerRadius = login_button.frame.size.width/10
        login_button.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
