//
//  PostViewController.swift
//  TTUTutoring
//
//  Created by Scott English on 01/6/2012.
//  Copyright © 2015 Turner. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var titlef: UITextField!
    @IBOutlet weak var Subject: UITextField!
    @IBOutlet weak var descriptionf: UITextView!
    
    @IBAction func Submit(sender: AnyObject) {
        /*
        let name_textfield = name.text;
        let titlef_data = titlef.text;
        let subject_data = Subject.text;
        let description_data = descriptionf.text;
        
        */
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
