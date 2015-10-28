//
//  PostModel.swift
//  TestSlideOut
//
//  Created by Kevin Taing on 10/14/15.
//  Copyright © 2015 Turner. All rights reserved.
//

var postMgr = PostModel()


import UIKit


class PostModel: NSObject {
    
    var posts: [post] = []
    
    struct post{
        var title: String
        var department: String
        var payRate: Double
        var description: String
        var isTutor: Bool
        var posterName: String
        var user: PFUser
        
    }
    
    
    func addPost(title: String, department: String, payRate: Double, description: String, isTutor: Bool, posterName: String, user: PFUser) {
        
        print("ADD POST")
        self.posts.append(post(title: title, department: department, payRate: payRate, description: description, isTutor: isTutor, posterName: posterName, user: user))
        
    }
    
    
    func getPost() {
        let postQuery = PFQuery(className:"Post")
        //postQuery.whereKey("isTutor", equalTo: true)
        
        postQuery.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
    
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) posts.")
                // Do something with the found objects
                if let objects = objects as [PFObject]? {
                    for object in objects {

                        self.addPost(object.objectForKey("title") as! String, department: object.objectForKey("department") as! String, payRate: object.objectForKey("payRate") as! Double, description: object.objectForKey("description") as! String, isTutor: object.objectForKey("isTutor") as! Bool, posterName: object.objectForKey("posterName") as! String, user: object.objectForKey("user") as! PFUser)
                    

                        print("Update table")
                        NSNotificationCenter.defaultCenter().postNotificationName("loadPostItems", object: nil)

                    
                    }
                    //calls loadData in HomeViewController
                    NSNotificationCenter.defaultCenter().postNotificationName("loadPostItems", object: nil)

                }
            }
            else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
}
