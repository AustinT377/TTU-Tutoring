//
//  ViewPostPageViewController.swift
//  TTUTutoring
//
//  Created by Kevin Taing on 11/11/15.
//  Copyright © 2015 Turner. All rights reserved.
//

import UIKit

class ViewPostPageViewController: UIViewController, HomeViewDelegate {

    var postIndex: Int?
    
    //userData Lables and descrption box
    @IBOutlet weak var usersName: UILabel!
    @IBOutlet weak var userTutor: UILabel!
    @IBOutlet weak var postsName: UILabel!
    @IBOutlet weak var postsSubject: UILabel!
    @IBOutlet weak var postsDate: UILabel!
    @IBOutlet weak var userRating: UILabel!
    @IBOutlet weak var descriptionBox: UITextView!
    @IBAction func messageButton(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        usersName.text = postMgr.posts[postIndex!].posterName
        postsName.text = postMgr.posts[postIndex!].title
        postsSubject.text = postMgr.posts[postIndex!].department
        descriptionBox.text = postMgr.posts[postIndex!].description
        if postMgr.posts[postIndex!].isTutor == true{
           userTutor.text = "Is Tutor"
        }
        else{
            userTutor.text = "Nope"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func passIndexPath(theIndexPath: Int) {
        postIndex = theIndexPath
        
    }
    

}
