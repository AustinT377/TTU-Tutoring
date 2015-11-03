//
//  PostPageViewController.swift
//  TTUTutoring
//
//  Created by Adam Nettel on 10/28/15.
//  Copyright © 2015 Turner. All rights reserved.
//

import UIKit

class PostPageViewController: UIViewController {

    
    @IBOutlet weak var studentOrTutorSegmentedControl: UISegmentedControl!
    @IBOutlet weak var titleOfPost: UITextField!
    
    @IBOutlet weak var descriptionOfPost: UITextView!
    @IBOutlet weak var payRate: UITextField!
    
    @IBOutlet weak var subject: UITextField!
    
    
    
    @IBAction func changedStudentOrTutor(sender: AnyObject) {
        // If changed to student, disable pay rate text field.
        // If changed to tutor, enable pay rate text field.
        
        if sender.selectedSegmentIndex == 0 {
            payRate.userInteractionEnabled = false
            payRate.placeholder = "Tutor"
        } else {
            payRate.userInteractionEnabled = true
            payRate.placeholder = "30"
        }
        
    }
    
    @IBAction func postButtonClicked(sender: AnyObject) {
        // Check that everything is filled out and save it to parse.
        
        // If basic stuff is filled in
        if titleOfPost.text != ""
        && descriptionOfPost != "Description"
        && subject.text != "" {
            
            // Different behavior depending on student or tutor
            if studentOrTutorSegmentedControl.selectedSegmentIndex == 0 {
                postMgr.addPostToServer(titleOfPost.text!, department: subject.text!, payRate: 0.0, description: descriptionOfPost.text, isTutor: false, posterName: "StudentTest", user: PFUser())
                goHome()
            
            } else if payRate.text != "" {
                postMgr.addPostToServer(titleOfPost.text!, department: subject.text!, payRate: Double(payRate.text!)!, description: descriptionOfPost.text, isTutor: true, posterName: "TutorTest", user: PFUser())
                goHome()
            
            // Not enough info for a tutor
            } else {
                let alert = UIAlertController(title: "Not Enough Info", message: "Please fill in all required information before you post.", preferredStyle: UIAlertControllerStyle.Alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
            }
        
        // Not enough info for tutor or student
        } else {
            let alert = UIAlertController(title: "Not Enough Info", message: "Please fill in all required information before you post.", preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func goHome() {
        
        postMgr.getPost()
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if studentOrTutorSegmentedControl.selectedSegmentIndex == 0 {
            payRate.userInteractionEnabled = false
            payRate.placeholder = "Tutor"
        }
        
        // Do any additional setup after loading the view.
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
