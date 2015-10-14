//
//  ThirdViewController.swift
//  TestSlideOut
//
//  Created by Austin Turner on 9/22/14.
//  Copyright (c) 2014 Turner. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var barButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barButton.target = self.revealViewController()
        barButton.action = Selector("revealToggle:")
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
