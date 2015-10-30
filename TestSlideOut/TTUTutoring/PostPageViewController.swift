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
    }
    
    @IBAction func postButtonClicked(sender: AnyObject) {
        // Check that everything is filled out and save it to parse.
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
